%%%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Process images with Gabor and smooth filters separately
%      Transfer the pixel value and generate the gray-scale image
%      Generate a threshold value and filter image to get the superimposed
%      result
%
% Input Variables:
%      I_t2           Input image 'texture2'
%      I_t1           Input image 'texture1'
%      I_3            Input image 'd9d77'
%      I_4            Input image 'd4d29'
%      
% Returned Results:
%      (num)_1     The 3D plot after applying Gabor filter
%      (num)_2     The 3D plot after applying smooth filter
%      (num)_3     The plot of gray-scale image m(x,y)
%      (num)_4     The plot of gray-scale image m'(x,y)
%      (num)_5     The plot of the superimposed image
%
% Processing Flow:
%      1.  Load in the 'texture2' image
%      2.  Use different filter functions to process the image and get the
%      plot respectively
%      3.  Scale the pixel value and generate image m(x,y) and m'(x,y)
%      4.  Calculte the threshold value and filter the image
%          
% Restrictions/Notes:
%      None
%
% The following functions are called:
%      Gabor.m       Apply Gabor filter to the image  
%      smooth.m      Apply smooth filter to the image 
%
%  Author:      Hao Zhou, Fan Yang
%  Date:        4/13/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clean windows, workspace, etc
clear;
close all;
clc;

% Creat a folder for output results
mkdir 'results'

%%  Question (1)
% Read in the image 'texture2'
I_t2 = imread('texture2.gif');
I_t2 = double(I_t2);

% Applying Gabor filter and generate 3D plot
m_t2 = Gabor(I_t2, 0.059, 8, 3*pi/4);
figure(1);
mesh(1 : size(m_t2, 1), 1 : size(m_t2, 2), m_t2);
title('applying Gabor filter to texture2');
saveas(figure(1), 'results\1_1.png');

% Applying smooth filter and generate 3D plot
m2_t2 = smooth(m_t2, 24);
figure(2);
mesh(1 : size(m2_t2, 2), 1 : size(m2_t2, 1), m2_t2);
title('applying smooth filter to texture2');
saveas(figure(2), 'results\1_2.png');

% Scale the pixel value and generate m(x,y) and m'(x,y) as the gray-scale
% image 
m_t2 = m_t2 * (1 / max(max(m_t2)));
figure(3);
imshow(m_t2); title('gray-scale texture2 m(x,y)');
saveas(figure(3), 'results\1_3.png');

m2_t2 = m2_t2 * (1 / max(max(m2_t2)));
figure(4);
imshow(m2_t2); title('gray-scale texture2 m’(x,y)');
saveas(figure(4), 'results\1_4.png');

% Using the mean of the max and min value as the threshold
thresh2 = 0.5 * max(m2_t2(:)) + 0.5 * min(m2_t2(:));
% Filtering m' and generate the superimposed result
m2_t2_thresh = m2_t2 > thresh2;
I_t2_seg = m2_t2_thresh * 0.5 + I_t2(2 * 32 + 1 : size(I_t2, 1) - 2 * 32, 2 * 32 + 1 : size(I_t2, 2) - 2 * 32) * 0.5;
figure(5);
imshow(I_t2_seg); title('superimposed texture2');
saveas(figure(5), 'results\1_5.png');


%%  Question (2)
% Read in the image 'texture1'
I_t1 = imread('texture1.gif');
I_t1 = double(I_t1);

% Applying Gabor filter and generate 3D plot
m_t1 = Gabor(I_t1, 0.042, 24, 0);
figure(6);
mesh(1 : size(m_t1, 1), 1 : size(m_t1, 2), m_t1);
title('applying Gabor filter to texture1');
saveas(figure(6), 'results\2_1.png');

% Applying smooth filter and generate 3D plot
m2_t1 = smooth(m_t1, 24);
figure(7);
mesh(1 : size(m2_t1, 2), 1 : size(m2_t1, 1), m2_t1);
title('applying smooth filter to texture1');
saveas(figure(7), 'results\2_2.png');

% Scale the pixel value and generate m(x,y) and m'(x,y) as the gray-scale
% image 
m_t1 = m_t1 * (1 / max(max(m_t1)));
figure(8);
imshow(m_t1); title('gray-scale texture1 m(x,y)');
saveas(figure(8), 'results\2_3.png');

m2_t1 = m2_t1 * (1 / max(max(m2_t1)));
figure(9);
imshow(m2_t1); title('gray-scale texture1 m’(x,y)');
saveas(figure(9), 'results\2_4.png');

% Using the mean of the max and min value as the threshold
thresh1 = 0.5 * (max(m2_t1(:)) + min(m2_t1(:)));
% Filtering m' and generate the superimposed result
m_t1_thresh = m2_t1 > thresh1;
I_t1_seg = m_t1_thresh * 0.5 + I_t1(2 * 48 + 1 : size(I_t1, 1) - 2 * 48, 2 * 48 + 1 : size(I_t1, 2) - 2 * 48) * 0.5;
figure(10);
imshow(I_t1_seg);title('superimposed texture1');
saveas(figure(10), 'results\2_5.png');


%%  Question (3)
% Read in the image 'd9d77'
I_3 = imread('d9d77.gif');
I_3 = double(I_3) / 255;

% Applying Gabor filter and generate 3D plot
m_3 = Gabor(I_3, 0.063, 36, pi/3);
figure(11);
mesh(1 : size(m_3, 2), 1 : size(m_3, 1), m_3);
title('applying Gabor filter to d9d77');
saveas(figure(11), 'results\3_1.png');

% Scale the pixel value and generate m(x,y) as the gray-scale image 
m_3 = m_3 * (1 / max(max(m_3)));
figure(12);
imshow(m_3); title('gray-scale d9d77 m(x,y)');
saveas(figure(12), 'results\3_3.png');

% Using the mean of the max and min value as the threshold
thresh3 = 0.5 * (max(m_3(:)) + min(m_3(:)));
% Filtering m' and generate the superimposed result
m_3_thresh = m_3 > thresh3;
I_3_seg = m_3_thresh * 0.5 + I_3(2 * 36 + 1 : size(I_3, 1) - 2 * 36, 2 * 36 + 1 : size(I_3, 2) - 2 * 36) * 0.5;
figure(13);
imshow(I_3_seg); title('superimposed d9d77');
saveas(figure(13), 'results\3_5.png');


%%  Question (4)
% Read in the image 'd4d29'
I_4 = imread('d4d29.gif');
I_4 = double(I_4) / 255;

% Applying Gabor filter and generate 3D plot
m_4 = Gabor(I_4, 0.6038, 8, -50.5*pi/180);
figure(14);
mesh(1 : size(m_4, 2), 1 : size(m_4, 1), m_4);
title('applying Gabor filter to d4d29');
saveas(figure(14), 'results\4_1.png');

% Applying smooth filter and generate 3D plot
m2_4 = smooth(m_4, 40);
figure(15);
mesh(1 : size(m2_4, 2), 1 : size(m2_4, 1), m2_4);
title('applying smooth filter to d4d29');
saveas(figure(15), 'results\4_2.png');

% Scale the pixel value and generate m(x,y) and m'(x,y) as the gray-scale
% image 
m_4 = m_4 * (1 / max(max(m_4)));
figure(16);
imshow(m_4); title('gray-scale d4d29 m(x,y)');
saveas(figure(16), 'results\4_3.png');

m2_4 = m2_4 * (1 / max(max(m2_4)));
figure(17);
imshow(m2_4); title('gray-scale d4d29 m’(x,y)');
saveas(figure(17), 'results\4_4.png');

% Using the mean of the max and min value as the threshold
thresh4 = 0.5 * (max(m2_4(:)) + min(m2_4(:)));
% Filtering m' and generate the superimposed result
m_4_thresh = m2_4 > thresh4;
I_4_seg = m_4_thresh * 0.5 + I_4(2 * 48 + 1 : size(I_4, 1) - 2 * 48, 2 * 48 + 1 : size(I_4, 2) - 2 * 48) * 0.5;
figure(18);
imshow(I_4_seg); title('superimposed d4d29');
saveas(figure(18), 'results\4_5.png');

