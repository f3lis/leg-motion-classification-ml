% takes all .xls in current folder and
% converts them to two cell arrays of example objects, train and test
% format is: train_data = {ex1, ex2 ...}
% files must be in format 'blahblah_label.xls' (ex: 'andrew_jump.xls')
% time values must occupy the first column and start at 0
function [train_data, test_data] = parse_data()
    % parse folder for all .xls file names
    addpath('data')
    file_names = {};
    all_files = dir('data');
    all_names = {all_files.name};
    for i = 1:numel(all_names)
        try
            if all_names{i}(end-3:end) == ".xls"
                file_names{end+1} = all_names{i};
            end
        catch
        end
    end
    
    % initialize cell array of all datasets
    data_raw = cell(1,numel(file_names));
    % remove titles (first row) of each data set and add data
    % data format is:
    % {{{t, x_acc, y_acc, z_acc, abs_acc}, "label"}, ...}
    % where t, x_acc ... are 1 x n cell arrays
    for i = 1:numel(file_names)
        data_i = readcell(file_names{i});
        % get label from filename
        if contains(file_names{i}, "walk")
            data_raw{i}{2} = "walk";
        elseif contains(file_names{i}, "run")
            data_raw{i}{2} = "run";  
        elseif contains(file_names{i}, "jump")
            data_raw{i}{2} = "jump";
        else
            error("Error: check that .xls files are properly named");
        end
        % extract data for each dimension (t, x_acc ...)
        for j = 1:size(data_i,2)
            data_raw{i}{1}{j} = data_i(2:end,1);
        end
    end
    
    
    % insert code here if we want to precompute gradient of data...

    % insert code here if we want to normalize data...
    
    
    % define all data as cell array of example objects
    data_all = {};
    % seperate date into 5 second chunks
    t_sep = 5; % this can be adjusted
    for i = 1:numel(data_raw)
        label = data_raw{i}{2};
        data_acc = data_raw{i}{1}(:); % (2:end) excludes time in data
        % parse through t, creating example object every 5 sec
        count = 0;
        start_ind = 1;
        for j = 1:numel(data_raw{i}{1}{1})
            count_n = floor(data_raw{i}{1}{1}{j} / t_sep);
            if count_n > count
                data_seg = cell(1,numel(data_acc));
                for k = 1:numel(data_acc)
                    data_seg{k} = [data_acc{k}{start_ind:j}];
                end
                data_all{end+1} = example(label, data_seg);
                count = count_n;
                start_ind = j + 1;
            end
        end
    end
    
    % sort all examples into train and test randomly
    train_data = {};
    test_data = {};
    for i = 1:numel(data_all)
        if rand() >= 0.5
            train_data{end+1} = data_all{i};
        else
            test_data{end+1} = data_all{i};
        end
    end
    
end