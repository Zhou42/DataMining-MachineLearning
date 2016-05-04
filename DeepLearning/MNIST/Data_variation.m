close all;
clear all;
clc;

%% load data
% load('MNIST_train.mat')
load('MNIST_test.mat')

[n, d] = size(X_test);
% imshow(uint8((reshape(X_train(1215,:),[28 28]) + 0.5)'*255));

%% Generate rotation
for tt = 1:n
    for i = -15 % [-15 0 15]
        img{tt}=imrotate(reshape(X_test(tt,:),[28 28])',i, 'crop');
        X_test_rotate_left(tt,:) = reshape(img{tt}',[1 28*28]);
    end
end

save('test_rotate_left','X_test_rotate_left');


for tt = 1:n
    for i = 15 % [-15 0 15]
        img{tt}=imrotate(reshape(X_test(tt,:),[28 28])',i, 'crop');
        X_test_rotate_right(tt,:) = reshape(img{tt}',[1 28*28]);
    end
end

save('test_rotate_right','X_test_rotate_right');


%% Generate translation
for tt = 1:n
    for i = -2 % [-2 2]
        se=translate(strel(1),[0 i * 1]);%%%%%%?? 
        img{tt}=imdilate(reshape(X_test(tt,:),[28 28])',se);
        X_test_move_left(tt,:) = reshape(img{tt}',[1 28*28]);
    end
end

save('test_move_left','X_test_move_left');

for tt = 1:n
    for i = 2 % [-2 2]
        se=translate(strel(1),[0 i * 1]);%%%%%%?? 
        img{tt}=imdilate(reshape(X_test(tt,:),[28 28])',se);
        X_test_move_right(tt,:) = reshape(img{tt}',[1 28*28]);
    end
end

save('test_move_right','X_test_move_right');

% for tt = 1:5000 % 1~5000 5001~10000 10001~15000 15001~20000
%     for i = [-15 0 15]
%         img{index}=imrotate(rgb2gray(X(:,:,:,tt)),i, 'crop');%%%%%%??
%         % figure,imshow(img{index});
%         % imwrite(img1,'a1.jpg');
%         X_test(index,:) = reshape(double(img{index}),[1 32*32])/255 - 0.5;
%         y_test(index,1) = y(tt);
%         index = index + 1;
%     end
% 
%     for i = [-2 2]
%         se=translate(strel(1),[0 i * 1]);%%%%%%?? 
%         img{index}=imdilate(rgb2gray(X(:,:,:,tt)),se);
%         X_test(index,:) = reshape(double(img{index}),[1 32*32])/255 - 0.5;
%         y_test(index,1) = y(tt);
%         % figure,imshow(img{index});
%         % imwrite(img2,'a2.jpg');
%         index = index + 1;
%     end
%     tt
% end


% save('trainData_4','X_variation','y_variation');
% save('testData','X_test','y_test');
