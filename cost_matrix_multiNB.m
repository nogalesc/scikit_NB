% Author: Chris Nogales
% Cost matrix of predictions using Multinomial Naive Bayes
close all; clc; clear;

y = csvread('y_test.csv');              % known groups
pred = csvread('pred_test.csv');        % predicted groups
CM = confusionmat(y,pred);
imagesc(CM)
colorbar;
colormap('hot');
xlabel('NB confusion matrix')


%%%%%%%%%%%%%%%%%%%%%%%%%%
CM = confusionmat(y,pred);
imagesc(CM)
colorbar;
colormap('hot');
xlabel('SVM confusion matrix')
