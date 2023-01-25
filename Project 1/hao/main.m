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
%  Restrictions/Notes:
%      1. note that we always create symetric SE, that is B = B^S
%      2. foreground pixels are 0s, while background pixels are 1s.
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
%       imb: binary image with type of bool(0/1)
imb = rgb2binary_(im);

% filter out salt-peper noise
%       imc: cleaned image
imc = denoise(imb);


% object detection using hit-or-miss operation
%       im1: (X erode A)
%       im2: (X^c erode B^S)
%       im3: ~(~im1 & ~im2) %%takes ~ because foreground is 0
%       im4: extended im3 based on the second largest circle's radius (r=29)
%       im5: image with selected circles only
[im1, im2, im3, im4, im5] = hit_or_miss(imc);


%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%