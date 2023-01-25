%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      detect smallest and biggest circles in the image  
%
% Input Variables:
%      im       input 2D image
%      
% Returned Results:
%      im_      A image with selected circles
%
% Processing Flow:
%      1.  convert a rbg image to binary image
%      2.  filter out salt-peper noise
%      3.  using hit or miss operation to find desired circles
%          
%
%  Restrictions/Notes:
%      TBD  
%
%  The following functions are called:
%      rgb2binary_.m     convert rgb image to binary image
%      denoise.m        remove salt-peper noise in a image
%      hit_or_miss.m    find desired circles using hit or miss transform
%
%  Author:      Hao Zhou
%  Date:        1/24/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% clean windows, workspace, etc
clear;
close all;
clc;


% read an image
im = imread('RandomDisks-P10.jpg');

% convert a rbg image to binary image
imb = rgb2binary_(im);

% filter out salt-peper noise
imc = denoise(imb);

% object detection using hit-or-miss operation
im_ = hit_or_miss(imc);

imshow(im_);


%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%