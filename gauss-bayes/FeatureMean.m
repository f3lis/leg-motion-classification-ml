%Walking data
%load and seperate data
pmwdata=table_creation("data/walking-priya.xls","walking");
amwdata = table_creation('data/walking_data_(flat)_auri.xls',"walking");
smwdata=table_creation('data/walking(flat)_sharon.xls', "walking");

%%
%Running Data

pmrdata=table_creation('data/running-priya.xls',"running");
amrdata=table_creation('data/auri_run.xls',"running");
smrdata= table_creation('data/running(flat)_sharon.xls',"running");
%%
%Jumping data

pmjdata= table_creation('data/jumping-priya.xls',"jumping");
amjdata=table_creation('data/auri_jump.xls',"jumping");
smjdata=table_creation('data/jumping(flat)_sharon.xls',"jumping");



%%
%Combine mean data
Featuresmean=[pmwdata;pmrdata;pmjdata;amwdata;amrdata;amjdata;smwdata;smrdata;smjdata]
[trainedClassifier, validationAccuracy]=trainClassifier(Featuresmean)
%%
function [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% Returns a trained classifier and its accuracy. This code recreates the
% classification model trained in Classification Learner app. Use the
% generated code to automate training the same model with new data, or to
% learn how to programmatically train models.
%
%  Input:
%      trainingData: A table containing the same predictor and response
%       columns as those imported into the app.
%
%  Output:
%      trainedClassifier: A struct containing the trained classifier. The
%       struct contains various fields with information about the trained
%       classifier.
%
%      trainedClassifier.predictFcn: A function to make predictions on new
%       data.
%
%      validationAccuracy: A double containing the accuracy in percent. In
%       the app, the History list displays this overall accuracy score for
%       each model.
%
% Use the code to train the model with new data. To retrain your
% classifier, call the function from the command line with your original
% data or new data as the input argument trainingData.
%
% For example, to retrain a classifier trained with the original data set
% T, enter:
%   [trainedClassifier, validationAccuracy] = trainClassifier(T)
%
% To make predictions with the returned 'trainedClassifier' on new data T2,
% use
%   yfit = trainedClassifier.predictFcn(T2)
%
% T2 must be a table containing at least the same predictor columns as used
% during training. For details, enter:
%   trainedClassifier.HowToPredict

% Auto-generated by MATLAB on 10-May-2021 18:34:28


% Extract predictors and response This code processes the data into the
% right shape for training the model.
inputTable = trainingData;
predictorNames = {'mA_x', 'mA_y', 'mA_z', 'mA_abs'};
predictors = inputTable(:, predictorNames);
response = inputTable.Motion;
isCategoricalPredictor = [false, false, false, false];

% Train a classifier This code specifies all the classifier options and
% trains the classifier.

% Expand the Distribution Names per predictor Numerical predictors are
% assigned either Gaussian or Kernel distribution and categorical
% predictors are assigned mvmn distribution Gaussian is replaced with
% Normal when passing to the fitcnb function
distributionNames =  repmat({'Normal'}, 1, length(isCategoricalPredictor));
distributionNames(isCategoricalPredictor) = {'mvmn'};

if any(strcmp(distributionNames,'Kernel'))
    classificationNaiveBayes = fitcnb(...
        predictors, ...
        response, ...
        'Kernel', 'Normal', ...
        'Support', 'Unbounded', ...
        'DistributionNames', distributionNames, ...
        'ClassNames', {'jumping'; 'running'; 'walking'});
else
    classificationNaiveBayes = fitcnb(...
        predictors, ...
        response, ...
        'DistributionNames', distributionNames, ...
        'ClassNames', {'jumping'; 'running'; 'walking'});
end

% Create the result struct with predict function
predictorExtractionFcn = @(t) t(:, predictorNames);
naiveBayesPredictFcn = @(x) predict(classificationNaiveBayes, x);
trainedClassifier.predictFcn = @(x) naiveBayesPredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedClassifier.RequiredVariables = {'mA_abs', 'mA_x', 'mA_y', 'mA_z'};
trainedClassifier.ClassificationNaiveBayes = classificationNaiveBayes;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2020b.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new table, T, use: \n  yfit = c.predictFcn(T) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nThe table, T, must contain the variables returned by: \n  c.RequiredVariables \nVariable formats (e.g. matrix/vector, datatype) must match the original training data. \nAdditional variables are ignored. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

% Extract predictors and response This code processes the data into the
% right shape for training the model.
inputTable = trainingData;
predictorNames = {'mA_x', 'mA_y', 'mA_z', 'mA_abs'};
predictors = inputTable(:, predictorNames);
response = inputTable.Motion;
isCategoricalPredictor = [false, false, false, false];

% Perform cross-validation
partitionedModel = crossval(trainedClassifier.ClassificationNaiveBayes, 'KFold', 5);

% Compute validation predictions
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);

% Compute validation accuracy
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
end


function [awalkingdata] = table_creation(file,mode)
%takes in excel file and creates table with mode column
aw_data=readmatrix(file);
awa_x = aw_data(:,2);
awa_y = aw_data(:,3);
awa_z = aw_data(:,4);
awa_abs = aw_data(:,5);

awa_x=smooth_filter(awa_x);
awa_y=smooth_filter(awa_y);
awa_z=smooth_filter(awa_z);
awa_abs=smooth_filter(awa_abs);

awa_x=mean(awa_x);
awa_y=mean(awa_y);
awa_z=mean(awa_z);
awa_abs=mean(awa_abs);

classaw = repmat(mode,[1 length(awa_z)]);
classaw = classaw(:);
awalkingdata=table(awa_x,awa_y,awa_z,awa_abs,classaw);
awalkingdata.Properties.VariableNames = ["mA_x","mA_y","mA_z","mA_abs","Motion"];


end