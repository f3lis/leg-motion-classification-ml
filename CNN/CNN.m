
function [net, info, test_acc] = CNN(train_data, train_labels, test_data, test_labels)

    width = size(train_data, 1); % should be 500
    channels = size(train_data, 2); % should be 4
    N = size(train_data, 3);
    train_data = reshape(train_data, [1, width, channels, N]);

    N_t = size(test_data, 3);
    test_data = reshape(test_data, [1, width, channels, N_t]);

    % Hyper-parameters
    c1_num = 10; % conv 1 number of filters
    c1_len = 40; % conv 1 filter length
    p1_sz = 5; % max pool 1 size

    % Network
    input = imageInputLayer([1 width channels]);
    
    c1 = convolution2dLayer([1 c1_len], c1_num,'stride',1);
    b1 = batchNormalizationLayer;
    r1 = reluLayer;
    p1 = maxPooling2dLayer([1 p1_sz],'stride', 10);

    c2 = convolution2dLayer([1 c1_len], 2*c1_num,'stride',1);
    b2 = batchNormalizationLayer;
    r2 = reluLayer;
    p2 = maxPooling2dLayer([1 p1_sz],'stride', 10);

    f1 = fullyConnectedLayer(3);
    f2 = fullyConnectedLayer(3);
    s1 = softmaxLayer;
    output = classificationLayer;

    convnet = [input; c1; b1; r1; p1; c2; b2; r2; p2; f1; f2; s1; output];

    ver = 1;
    if ver == 1
        % Basic
        opts = trainingOptions('sgdm', 'MaxEpochs', 60, 'Plots','training-progress');
    elseif ver == 2
        % L2 Regularization
        opts = trainingOptions('sgdm', 'MaxEpochs', 30, 'L2Regularization', 0.0001, 'Plots','training-progress');
    elseif ver == 3
        % Cross Validation
        opts = trainingOptions('sgdm', 'MaxEpochs', 30, ...
            'ValidationData', {test_data,test_labels});
    end

    [net,info] = trainNetwork(train_data, train_labels, convnet, opts);

    test_pred = classify(net, test_data);
    test_acc = sum(test_pred == test_labels) / numel(test_labels);
    %disp(test_acc)
end
