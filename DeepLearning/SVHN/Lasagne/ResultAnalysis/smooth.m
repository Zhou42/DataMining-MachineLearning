function [ output_args ] = smooth( input_args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
output_args = filter([1/3 1/3 1/3],[1],input_args)

end

