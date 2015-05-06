
% Visualization of features extracted
% M = dlmread('features_only_two_samples',':')
% [Y,X]= svmlread('features_only_two_samples');
M = csvread('foofoo.csv');
num_samples = size(M,1);
y = [1:num_samples];
X = M(:,4); % first feature
bar(y,X)
