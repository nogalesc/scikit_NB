% Learn about API authentication here: https://plot.ly/matlab/getting-started
% Find your api_key here: https://plot.ly/settings/api

size = 50;
z = zeros(size, size);
for r = 1:size
    for c = 1:size
        z(r,c) = r+c;
    end
end
fig = figure;

% % % y = csvread('y_test.csv');              % known groups
% % % pred = csvread('pred_test.csv');        % predicted groups
% % % CM = confusionmat(y,pred);

colormap('hot');
imagesc(z);
colorbar;

%--PLOTLY--%

% Strip MATLAB style by default!
response = fig2plotly(fig, 'filename', 'matlab-basic-heatmap');
plotly_url = response.url;