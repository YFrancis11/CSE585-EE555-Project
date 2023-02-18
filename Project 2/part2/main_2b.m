%%%%%%%%%%%%% main_2a.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Separate the objects from the original and rotated image 
%      respectively
%      Calculate fn for each objects and calculate the distance between the 
%      original and rotated objects and get the matching objects
%
% Input Variables:
%      shadow       Input image 'shadow1'
%      shadow_r     Input image 'shadow1rotated' 
%      
% Returned Results:
%      table 1 (command window) The distance between the objects in 
%      'shadow1' and 'shadow1rotated'  
%
% Processing Flow:
%      1.  Create 3 * 3 square SE
%      2.  Load in the 'shadow1' image
%      3.  Separate the four objects from the original image and resize
%      them
%      4.  Load in the 'shadow1rotated' image
%      5.  Separate the four objects from the rotated image and resize
%      them
%      6.  Calculte fn for each objects
%      7.  Calculte the distance between the original and rotated objects
%          
% Restrictions/Notes:
%      1. Background pixels are 0s, while Foreground pixels are 1s.
%      2. The result tables of the distance is displayed in the command
%      window
%
% The following functions are called:
%      zero.m       generate image full of zeros 
%      resize.m     using dilate operation to resize the image 
%      cal_ufh.m    calculate Un, fn and H for the objects
%      cal_d2.m     calculate the distance between objects
%
%  Author:      Fan Yang
%  Date:        2/17/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clean windows, workspace, etc
clear;
close all;
clc;

% Create the 3 * 3 square SE with all values = 1
se = zero(3, 3) + 1;

% Read in the original image 
shadow = imread('Input\shadow1.gif');
shadow = double(shadow);

% Separate the four objects from the original image
shadow1 = shadow(70 : 150, 4 : 55);
shadow2 = shadow(75 : 150, 50 : 135);
shadow3 = shadow(75 : 155, 130 : 175);
shadow4 = shadow(75 : 155, 175 : 230);

% Resize the obj images
re = zeros(size(shadow, 1) / 2, size(shadow, 1) / 2);
shadow1 = resize(re, shadow1);
shadow2 = resize(re, shadow2);
shadow3 = resize(re, shadow3);
shadow4 = resize(re, shadow4);

% Read in the rotated image 
shadow_r = imread('Input\shadow1rotated.gif');
shadow_r = double(shadow_r);

% Separate the four objects from the rotated image
shadow1_r = shadow_r(70 : 150, 14 : 75);
shadow2_r = shadow_r(80 : 155, 73 : 140);
shadow3_r = shadow_r(78 : 160, 140 : 185);
shadow4_r = shadow_r(78 : 155, 180 : 250);

% Resize the obj images
re_r = zeros(size(shadow_r, 1) / 2, size(shadow_r, 1) / 2);
shadow1_r = resize(re_r,shadow1_r);
shadow2_r = resize(re_r,shadow2_r);
shadow3_r = resize(re_r,shadow3_r);
shadow4_r = resize(re_r,shadow4_r);

% Use function to calculte fn for the objects
[Un1, fn1] = cal_ufh(shadow1, se);
[Un2, fn2] = cal_ufh(shadow2, se);
[Un3, fn3] = cal_ufh(shadow3, se);
[Un4, fn4] = cal_ufh(shadow4, se);

[Un1_r, fn1_r] = cal_ufh(shadow1_r, se);
[Un2_r, fn2_r] = cal_ufh(shadow2_r, se);
[Un3_r, fn3_r] = cal_ufh(shadow3_r, se);
[Un4_r, fn4_r] = cal_ufh(shadow4_r, se);

% Use function to calculete the distance between objects in original image
% and rotated image
[d1, d2, d3, d4] = cal_d2(fn1, fn2, fn3, fn4, fn1_r, fn2_r, fn3_r, fn4_r);

% Print distance table
d = [d1; d2; d3; d4];

T = array2table(dlarray(d),...
    'VariableNames', ...
    {'rotate object 1','rotate object 2','rotate object 3','rotate object 4'}, ...
    'RowNames',{'object 1','object 2','object 3','object 4'});
fprintf('The value of distance between "shadow1rotated" and "shadow1":\n')
disp(T)






