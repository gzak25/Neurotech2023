% A function for live RPS classification of EMG data from the Pison armband
% EMG devices. It will use the dataPrep function to prepare the live data
% for our classifier, load our classifier, run the classifier on the data
% and export its prediction.

% RENAME THE VARIABLES IN HERE LATER, NOT SURE WHAT TO CALL IT OTHERWISE
% REMOVE THE INCLUDED FEATURES EVENTUALLY SINCE THAT WILL LIKELY BE HARD
% CODED IN THE FINAL FUNCTIONS

function ypred = runMatlabModel(data)
    % Prepare the data for the classifier
    includedFeatures = {'std', 'mad'};
    selected_features = [1 2 3 4 5 6 7 8];
    [dataChTimeTr] = livepreprocessData(data);   %Consider removing labels input
    feature_table = pullFeatures(dataChTimeTr,includedFeatures);
     selected_feature_table = feature_table(:,selected_features);
    % plot(dataChTimeTr(1,:,:))
    % Load our pre-saved RPS classifier
    load("mymodel.mat", "currentClassifier")
    % Run the classifier on our live features
    

    ypred_ = (currentClassifier.predict(selected_feature_table));
    % disp(ypred_)
    ypred = ypred_(2);
    % Output our classifier's prediction
    
end