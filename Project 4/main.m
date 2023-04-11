%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Gabor Filter
%
% Input Variables:
%      I       input 2D image
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
%  Author:     
%  Date:        04/11/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% clean windows, workspace, etc
clear;
close all;
clc;


mkdir 'results'


pic_name = 'texture2';

% read an image as binary image
I = logical(imread(strcat(pic_name, '.gif')));

F = 0.059;
theta = 135;
sigma = 8;
scale_factor = 2000;
[h_x, h_y] = find_gabor(F, deg2rad(theta), sigma);
m = apply_gabor(I, h_x, h_y);

name = strcat('results/', strcat(pic_name, strcat('_m(x,y)', '.png')));
imwrite(m*scale_factor, name);

name = strcat('results/', strcat(pic_name, strcat('_m(x,y)_3d', '.png')));
figure(1);
mesh(1:size(m,1),1:size(m,2),m);title(strcat('applying Gabor filter: ', pic_name));
saveas(figure(1), name, 'png');



%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%