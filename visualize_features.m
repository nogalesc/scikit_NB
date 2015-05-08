close all; clc; clear;
my_feature = 5;
% Visualization of features extracted
% Compare one feature for a pos and negt example in the train data.
M_train = csvread('X_train.csv');
truelabels_tr = csvread('y_train.csv');
% First separate positive/negative calsses
feat_yes_tr = M_train(truelabels_tr==1,:); % Class +1 samples 
feat_no_tr = M_train(truelabels_tr==-1,:); % Class -1 samples
% Compare one feature for a pos and negt example in the test data.
X_train_yes = feat_yes_tr(:,my_feature);                          
X_train_no = feat_no_tr(:,my_feature);                         
y_train_yes = [1:size(X_train_yes,1)];
y_train_no = [1:size(X_train_no,1)];
figure;
plot(y_train_yes,X_train_yes,y_train_no,X_train_no)
legend('Positive train sample feature','Negative train sample feature')
title('A feature in positive and negative training samples')
xlabel('Training Samples') % x-axis label
ylabel('Feature value') % y-axis label

% M = dlmread('features_only_two_samples',':')
% [Y,X]= svmlread('features_only_two_samples');
M = csvread('X_test.csv');
truelabels = csvread('y_test.csv');
pred = csvread('pred_test.csv');
% First separate positive/negative calsses
feat_yes = M(truelabels==1,:); % Class +1 samples 
feat_no = M(truelabels==-1,:); % Class -1 samples
% Compare one feature for a pos and negt example in the test data.
X_yes = feat_yes(:,my_feature);                          
X_no = feat_no(:,my_feature);                         
y_yes = [1:size(X_yes,1)];
y_no = [1:size(X_no,1)];
figure;
plot(y_yes,X_yes,y_no,X_no)
legend('Positive sample feature','Negative sample feature')
title('A feature in positive and negative test samples')
xlabel('Test Samples') % x-axis label
ylabel('Feature value') % y-axis label

