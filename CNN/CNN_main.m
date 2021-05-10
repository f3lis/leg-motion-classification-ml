
[data, labels] = parse_data();

d1 = data(:,end,:);

% sort all examples into train and test randomly
N = size(data, 3);

K = 3;
k_ind = crossvalind('KFold', N, K);

acc = 0;
for i = 1:K
    train_data = d1(:,:,i == k_ind);
    train_labels = labels(i == k_ind);
    test_data = d1(:,:,i ~= k_ind);
    test_labels = labels(i ~= k_ind);
    [net, info, test_acc] = CNN(train_data, train_labels, test_data, test_labels);
    acc = acc + test_acc / K;
end

disp(acc)


% add gaussian
g = imfilter(data(:,end,:),1/44*[1; 4; 9; 16; 9; 4; 1],'replicate');
% add sobel
s = imfilter(g,[-1; 0; 1],'replicate');
% peaks
%[pks,locs] = findpeaks(data);


d2 = cat(2, data, g, s);

acc = 0;
for i = 1:K
    train_data = d2(:,:,i == k_ind);
    train_labels = labels(i == k_ind);
    test_data = d2(:,:,i ~= k_ind);
    test_labels = labels(i ~= k_ind);
    [net, info, test_acc] = CNN(train_data, train_labels, test_data, test_labels);
    acc = acc + test_acc / K;
end

disp(acc)