close all;
clear all;
clc;

data = csvread('./Data/Workbook2.csv');
csvwrite('test.csv',[[1:28000]',data]);