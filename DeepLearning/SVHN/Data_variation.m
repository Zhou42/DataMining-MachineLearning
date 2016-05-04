close all;
clear all;
clc;

% load('train_32x32.mat')
load('test_32x32.mat')

% test_pic = rgb2gray(X(:,:,:,1));
[h,w,c,n] = size(X);
X_test = [];
% imshow(test_pic);
index = 1;

for tt = 1:5000 % 1~5000 5001~10000 10001~15000 15001~20000
    for i = [-15 0 15]
        img{index}=imrotate(rgb2gray(X(:,:,:,tt)),i, 'crop');%%%%%%??
        % figure,imshow(img{index});
        % imwrite(img1,'a1.jpg');
        X_test(index,:) = reshape(double(img{index}),[1 32*32])/255 - 0.5;
        y_test(index,1) = y(tt);
        index = index + 1;
    end

    for i = [-2 2]
        se=translate(strel(1),[0 i * 1]);%%%%%%?? 
        img{index}=imdilate(rgb2gray(X(:,:,:,tt)),se);
        X_test(index,:) = reshape(double(img{index}),[1 32*32])/255 - 0.5;
        y_test(index,1) = y(tt);
        % figure,imshow(img{index});
        % imwrite(img2,'a2.jpg');
        index = index + 1;
    end
    tt
end


% save('trainData_4','X_variation','y_variation');
save('testData','X_test','y_test');
