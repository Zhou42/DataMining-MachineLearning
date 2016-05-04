clear all;
close all;
clc;

% load('MNIST_train.mat');
load('MNIST_test.mat');

[n_test, d_test] = size(X_test);

for i = 1:n_test
    X_test_lasagne(i,1,:,:) = (reshape(X_test(i,:),[28 28])' + 0.5) * 255/256;
end

save('X_test_lasagne','X_test_lasagne'
);