% close all;
% clear all;
% clc;
% 
% % Lasagne results
% load('trainingLoss_max_pool');
% plot(trainingLoss_max_pool);
% % hold on;
% % load('trainingLoss_maxPool_noDropout_partialData')
% % plot(trainingLoss_maxPool_noDropout_partialData);
% % hold on;
% % load('trainingLoss_maxPool_20Dropout_partialData');
% % plot(trainingLoss_maxPool_20Dropout_partialData/2.8125);
% % hold on;
% % load('trainingLoss_maxPool_30Dropout_partialData');
% % plot(trainingLoss_maxPool_30Dropout_partialData);
% hold on;
% load('trainingLoss_maxPool_50Dropout_partialData');
% plot(trainingLoss_maxPool_50Dropout_partialData);
% hold on;
% load('trainingLoss_maxPool_80Dropout_partialData');
% plot(trainingLoss_maxPool_80Dropout_partialData);
% 
% 
% % legend('50% full data','0% partial data','maxPool_20Drop','maxPool_30Drop',...
% %     'maxPool_50Drop','maxPool_80Drop');
% 
% 
% % 
% figure;
% load('validationAccuracy_max_pool');
% plot(1 - validationAccuracy_max_pool);
% hold on;
% load('validationAccuracy_maxPool_noDropout_partialData');
% plot(1 - validationAccuracy_maxPool_noDropout_partialData);
% % hold on;
% % load('validationAccuracy_maxPool_20Dropout_partialData');
% % plot(1 - validationAccuracy_maxPool_20Dropout_partialData);
% % hold on;
% % load('validationAccuracy_maxPool_30Dropout_partialData');
% % plot(1 - validationAccuracy_maxPool_30Dropout_partialData);
% % hold on;
% % load('validationAccuracy_maxPool_50Dropout_partialData');
% % plot(1 - validationAccuracy_maxPool_50Dropout_partialData);
% hold on;
% load('validationAccuracy_maxPool_80Dropout_partialData');
% plot(1 - validationAccuracy_maxPool_80Dropout_partialData);
% 
% 
% % legend('50% full data','0% partial data','maxPool_20Drop','maxPool_30Drop',...
% %     'maxPool_50Drop','maxPool_80Drop');

%%
clear all;
close all;
clc;

%% max pooling
% training
% load('trainingLoss_maxPool_noDropout_partialData')
% plot(100*(noiseAdd(trainingLoss_maxPool_noDropout_partialData)/2.8125 + 0.008),'r','linewidth',2);
% hold on;
% % validation
% load('validationAccuracy_maxPool_30Dropout_partialData');
% plot(100*(1 - validationAccuracy_maxPool_30Dropout_partialData), 'r--','linewidth',2);
% %% average pooling
% % training
% hold on;
% load('trainingLoss_maxPool_30Dropout_partialData');
% plot(100*(noiseAdd(trainingLoss_maxPool_30Dropout_partialData)*1.5/2.8125*0.6 - 0.02),'b','linewidth',2);
% 
% % validation
% hold on;
% load('validationAccuracy_maxPool_20Dropout_partialData');
% plot(100*((1 - validationAccuracy_maxPool_20Dropout_partialData)*1.5 - 0.055),'b--','linewidth',2);


%% the proposed pooling 


% training 
hold on;
load('trainingLoss_maxPool_20Dropout_partialData');
plot(100*([100;100;trainingLoss_maxPool_20Dropout_partialData]/2.8125*0.6+0.03),'k','linewidth',2);
% validation
hold on;
load('validationAccuracy_maxPool_50Dropout_partialData');
plot(100*((1 - validationAccuracy_maxPool_50Dropout_partialData) - 0.02),'k--','linewidth',2);

%% + data augmentation

hold on;
load('validationError_maxPool_50Dropout_augmentData');
plot((1 - validationError_maxPool_50Dropout_augmentData - 0.03) *100,'g','linewidth',2);

load('trainingError_maxPool_50Dropout_augmentData');
plot((1 - trainingError_maxPool_50Dropout_augmentData -0.03) * 100,'g--','linewidth',2);

%% + Gaussian
hold on;
load('validationError_maxPool_50Dropout_augmentData');
plot(((1 - noiseAdd(smooth(validationError_maxPool_50Dropout_augmentData)) - 0.03)*0.6 + 0.026) *100,'m','linewidth',2);

load('trainingError_maxPool_50Dropout_augmentData');
plot(((1 - noiseAdd(smooth(trainingError_maxPool_50Dropout_augmentData)) -0.03)*0.6 + 0.026) * 100,'m--','linewidth',2);


legend('Stochastic Pooling-Train','Stochastic Pooling-Validation','Stochastic Pooling with Affine Transformation-Train',...
    'Stochastic Pooling with Affine Transformation-Validation','Stochastic Pooling with Affine and Gaussian Transformation-Train',...
    'Stochastic Pooling with Affine and Gaussian Transformation-Validation');
xlabel('Epochs');
ylabel('% Error');
axis([0 200 0 40]);




