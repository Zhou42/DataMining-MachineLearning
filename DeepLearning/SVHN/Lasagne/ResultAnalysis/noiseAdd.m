function [ out_vec ] = noiseAdd( in_vec )
%CHANGERANGE Summary of this function goes here
%   Detailed explanation goes here
    out_vec = in_vec + randn(size(in_vec)) * 0.001;
end

