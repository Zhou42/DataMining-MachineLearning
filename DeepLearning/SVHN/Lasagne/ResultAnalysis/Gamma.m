close all;
clear all;
clc;

test_error = [10.32 8.68 8.75 9.25 9.48 9.53];
gamma = [0 1 10 100 1000];

bar(test_error,0.5);
% plot(test_error);

set(gca,'XTickLabel',{'0','1','2','3','10','100'}) ;
% plot(test_error);
xlabel('\gamma');
ylabel('Test error %');
% axis([0 5 0 12]);
hold on;
ylim([0,12]);
