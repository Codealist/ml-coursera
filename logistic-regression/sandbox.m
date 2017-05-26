%% Initialization
clear ; close all; clc

data = load('ex2data2.txt');
X = data(:, [1, 2]); y = data(:, 3);


X = mapFeature(X(:,1), X(:,2));

