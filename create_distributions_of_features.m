close all; clc; clear;
% Visualization of features extracted
% Compare one feature for a pos and negt example in the train data.
A = csvread('X_train.csv');
% Normalize column-wise

normA = max(A) - min(A);               % this is a vector
normA = repmat(normA, [length(A) 1]);  % this makes it a matrix                                      % of the same size as A
normalizedA = A./normA;  % your normalized matrix

truelabels_tr = csvread('y_train.csv');
% First separate positive/negative calsses
feat_yes_tr = normalizedA(truelabels_tr==1,:); % Class +1 samples 
feat_no_tr = normalizedA(truelabels_tr==-1,:); % Class -1 samples
X_train_yes = feat_yes_tr(:,1);                          
X_train_no = feat_no_tr(:,1);              
y_train_yes = [1:size(X_train_yes,1)];
y_train_no = [1:size(X_train_no,1)];

% plot(feat_yes_tr,y_train_yes)
labels = {'1','2',...
          '3','4',...
          '5','6',...
          '7','8',...
          '9','10'};
parallelcoords(normalizedA(:,1:10),'group',truelabels_tr,'labels',labels);
xlabel('Visualization of subset of features in positive and negative samples')
% parallelcoords(X_train_yes)
% figure;
% parallelcoords(X_train_no)

% 
% % % % % M = dlmread('features_only_two_samples',':')
% % % % % [Y,X]= svmlread('features_only_two_samples');
% % % % M = csvread('X_test.csv');
% % % % truelabels = csvread('y_test.csv');
% % % % pred = csvread('pred_test.csv');
% % % % % First separate positive/negative calsses
% % % % feat_yes = M(truelabels==1,:); % Class +1 samples 
% % % % feat_no = M(truelabels==-1,:); % Class -1 samples
% % % % % Compare one feature for a pos and negt example in the test data.
% % % % X_yes = feat_yes(:,1);                          
% % % % X_no = feat_no(:,1);                         
% % % % y_yes = [1:size(X_yes,1)];
% % % % y_no = [1:size(X_no,1)];
% % % % 
