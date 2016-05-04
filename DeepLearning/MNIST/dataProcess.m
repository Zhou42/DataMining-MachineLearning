close all;
clear all;
clc;

%% before data variation
% data = csvread('./Data/train.csv',1,0);
% % [n, d] = size(data(:,2:785));
% X_train = double(data(:,2:785))/255 - 0.5;
% y_train = data(:,1); 
% save('MNIST_train.mat','X_train','y_train');
% %
% data = csvread('./Data/test.csv',1,0);
% X_test = double(data)/255 - 0.5;
% save('MNIST_test.mat','X_test');

%% elastic transformation
% data = csvread('./Data/train_distort.csv');
% [n, d] = size(data);


% X_train = double(data(:,2:785))/255 - 0.5;
% y_train = data(:,1); 
% save('MNIST_train.mat','X_train','y_train');


%% data fusion
load('MNIST_train.mat');
load('MNIST_test.mat');
load('train_move_left.mat');
load('train_move_right.mat');
load('train_rotate_left.mat');
load('train_rotate_right.mat');

load('test_move_left.mat');
load('test_move_right.mat');
load('test_rotate_left.mat');
load('test_rotate_right.mat');


X_train_Augmented = [X_train; X_train_move_left; X_train_move_right; X_train_rotate_left; X_train_rotate_right];
y_train_Augmented = [y_train; y_train_move_left; y_train_move_right; y_train_rotate_left; y_train_rotate_right];

X_test_Augmented = [X_test; X_test_move_left; X_test_move_right; X_test_rotate_left; X_test_rotate_right];

save('Augmented_Data','X_train_Augmented', 'y_train_Augmented', 'X_test_Augmented');
