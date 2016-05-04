close all;
clear all;
clc;

load('train_32x32.mat');
% load('test_32x32.mat');

[a, b, l, n] = size(X);

for i = 1:n
%     X_bw(:,:,i) = rgb2gray(X(:,:,:,i)); 
    X_bw(i,:) = reshape(rgb2gray(X(:,:,:,i)), [1 a*b]); 
end

% X_bw = double(X_bw)/255 - 0.5;

y_train = y - 1; 

% save('SVNH_data.mat','X_bw','y');

%% for lasagne train
% for i = 1:n
%     X_lasagne_train(i,1,:,:) = double(rgb2gray(X(:,:,:,i)))/255 - 0.5; 
% end
% 
% save('SVNH_trainData_lasagne.mat','X_lasagne_train','y_train');

%% for lasagne test
% load('test_32x32.mat');
% [a, b, l, n] = size(X);
% y_test = y - 1; 
% 
% for i = 1:n
%     X_lasagne_test(i,1,:,:) = double(rgb2gray(X(:,:,:,i)))/255 - 0.5; 
% end
% 
% save('SVNH_testData_lasagne.mat','X_lasagne_test','y_test');


% %% for lasagne; data generation
% % train data
% index = 1;
% load('trainData_1.mat');
% [n, d] = size(X_variation);
% y = y_variation - 1;
% 
% for i = 1:n
%     X_train(index,1,:,:) = reshape(X_variation(i,:),[32 32]); 
%     y_train(index) = y(i);
%     index = index + 1;
% end
% 
% disp('finish part 1');
% %============================
% load('trainData_2.mat');
% [n, d] = size(X_variation);
% y = y_variation - 1;
% 
% for i = 1:n
%     X_train(index,1,:,:) = reshape(X_variation(i,:),[32 32]); 
%     y_train(index) = y(i);
%     index = index + 1;
% end
% disp('finish part 2');
% %============================
% load('trainData_3.mat');
% [n, d] = size(X_variation);
% y = y_variation - 1;
% 
% for i = 1:n
%     X_train(index,1,:,:) = reshape(X_variation(i,:),[32 32]); 
%     y_train(index) = y(i);
%     index = index + 1;
% end
% disp('finish part 3');
% %============================
% load('trainData_4.mat');
% [n, d] = size(X_variation);
% y = y_variation - 1;
% 
% for i = 1:n
%     X_train(index,1,:,:) = reshape(X_variation(i,:),[32 32]); 
%     y_train(index) = y(i);
%     index = index + 1;
% end
% disp('finish part 4');
% save('SVNH_trainAugmentedData_lasagne.mat','X_train','y_train');

% % test data
% load('testData.mat');
% [n,d] = size(X_test);
% y_test_augment = y_test - 1;
% 
% for i = 1:n
%     X_test_augment(i,1,:,:) = reshape(X_test(i,:),[32 32]); 
% end
% save('SVNH_testAugmentedData_lasagne.mat','X_test_augment','y_test_augment');

