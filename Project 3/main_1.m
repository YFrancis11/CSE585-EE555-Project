%%%%%%%%%%%%% main_1.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Process images using 5 different filters 
%      Save the output image and generate the gray-scal histogram
%      Select an interior of the large disk region and calculate the mean 
%      and standard deviation
%
% Input Variables:
%      I           Input image 'disk'
%      
% Returned Results:
%      5x5(filter)_1     The plot after implement 1 iteration
%      5x5(filter)_2     The plot after implement 5 iteration
%      5x5(filter)_3     The plot of gray-scal histogram
%      text 1 (command window) The mean for each filters
%      text 2 (command window) The standard deviation for each filters 
%
% Processing Flow:
%      1.  Load in the 'disk' image
%      2.  Use different filter functions to process the image for 1 and 5 
%      iteration respectively.
%      3.  Define the sub-region (we choose 90 : 154 and 61 : 125)
%      4.  Calculte the mean and standard deviation
%          
% Restrictions/Notes:
%      None
%
% The following functions are called:
%      mean5x5.m       Compute a 5X5 mean filter at each pixel in an image  
%      alpha5x5.m      Compute a 5X5 alpha-trimmed mean filter at each 
%                      pixel in an image 
%      sigma5x5.m      Compute a 5X5 sigma filter at each pixel in an image
%      symmetric5x5.m  Compute a 5×5 symmetric nearest-neighbor mean filter 
%                      at each pixel in an image 
%
%  Author:      Fan Yang
%  Date:        3/25/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clean windows, workspace, etc
clear;
close all;
clc;

% Creat a folder for output results
mkdir 'results\question_1'

% Read in the image
I = imread('disk.gif');
I = double(I);

%%  Implement 1 iteration
% Implement 5×5 mean filter and save the output result
res1 = mean5x5(I);
imwrite(uint8(res1), 'results\question_1\5x5mean_1.png');

% Implement 5×5 median filter, save the output result
res2 = medfilt2(I);
imwrite(uint8(res2), 'results\question_1\5x5median_1.png');

% Implement 5×5 alpha-trimmed mean filter, save the output result
res3 = alpha5x5(I, 0.25);
imwrite(uint8(res3), 'results\question_1\5x5alpha_1.png');

% Implement 5×5 sigma filter, save the output result
res4 = sigma5x5(I, 20);
imwrite(uint8(res4), 'results\question_1\5x5sigma_1.png');

% Implement 5×5 symmetric nearest-neighbor mean filter, save the output result
res5 = symmetric5x5(I);
imwrite(uint8(res5), 'results\question_1\5x5symmetric_1.png');


%%  Implement 5 iteration
% Reset the result matrices and repeat each filter 5 times to get the new
% output image
res1 = I;
res2 = I;
res3 = I;
res4 = I;
res5 = I;

for i = 1 : 5
    res1 = mean5x5(res1);
    res2 = medfilt2(res2);
    res3 = alpha5x5(res3, 0.25);
    res4 = sigma5x5(res4, 20);
    res5 = symmetric5x5(res5);
end

imwrite(uint8(res1), 'results\question_1\5x5mean_2.png');
imwrite(uint8(res2), 'results\question_1\5x5median_2.png');
imwrite(uint8(res3), 'results\question_1\5x5alpha_2.png');
imwrite(uint8(res4), 'results\question_1\5x5sigma_2.png');
imwrite(uint8(res5), 'results\question_1\5x5symmetric_2.png');

% Generate the gray-scal histogram for each output separately
% 5×5 mean filter
figure(1);
[counts1, x1] = imhist(uint8(res1), 256);  
counts1 = counts1 / (256 * 256);
stem(x1, counts1), title('5×5 mean filter gray-scale histogram');
saveas(figure(1), 'results\question_1\5x5mean_3', 'png');

% 5×5 median filter
figure(2);
[counts2, x2] = imhist(uint8(res2), 256);  
counts2 = counts2 / (256 * 256);      
stem(x2, counts2), title('5×5 median filter gray-scale histogram');
saveas(figure(2), 'results\question_1\5x5median_3', 'png');

% 5×5 alpha-trimmed mean filter
figure(3);
[counts3, x3] = imhist(uint8(res3), 256);
counts3 = counts3 / (256 * 256);
stem(x3, counts3), title('5×5 alpha-trimmed mean filter gray-scale histogram');
saveas(figure(3), 'results\question_1\5x5alpha_3', 'png');
 
% 5×5 sigma filter
figure(4);
[counts4, x4] = imhist(uint8(res4), 256);
counts4 = counts4 / (256 * 256);
stem(x4, counts4), title('5×5 sigma filter gray-scale histogram');
saveas(figure(4), 'results\question_1\5x5sigma_3', 'png');

% 5×5 symmetric nearest-neighbor mean filter
figure(5);
[counts5, x5] = imhist(uint8(res5), 256);  
counts5 = counts5 / (256 * 256);
stem(x5, counts5), title('5×5 symmetric nearest-neighbor mean filter gray-scale histogram');
saveas(figure(5), 'results\question_1\5x5symmetric_3', 'png');


%%  Calculate mean and standard deviation
% Define the sub-region
region0 = I(90 : 154, 61 : 125); 
region1 = res1(90 : 154, 61 : 125); 
region2 = res2(90 : 154, 61 : 125);
region3 = res3(90 : 154, 61 : 125);
region4 = res4(90 : 154, 61 : 125);
region5 = res5(90 : 154, 61 : 125);

% Calculate and output the mean and standard deviation
mean0 = mean(mean(region0));
mean1 = mean(mean(region1));
mean2 = mean(mean(region2));
mean3 = mean(mean(region3));
mean4 = mean(mean(region4));
mean5 = mean(mean(region5));

fprintf('The mean for each filters are:\n')
fprintf('5×5 mean: %f\n5×5 median: %f\n5×5 alpha-trimmed mean: %f\n', mean1, mean2, mean3)
fprintf('5×5 sigma: %f\n5×5 symmetric nearest-neighbor mean: %f\n', mean4, mean5)
fprintf('The mean for original image are: %f\n\n', mean0)

d0 = std2(region0);
d1 = std2(region1);
d2 = std2(region2);
d3 = std2(region3);
d4 = std2(region4);
d5 = std2(region5);

fprintf('The standard deviation for each filters are:\n')
fprintf('5×5 mean: %f\n5×5 median: %f\n5×5 alpha-trimmed mean: %f\n', d1, d2, d3)
fprintf('5×5 sigma: %f\n5×5 symmetric nearest-neighbor mean: %f\n', d4, d5)
fprintf('The standard deviation for original image are: %f\n', d0)

