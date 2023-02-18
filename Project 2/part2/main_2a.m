%%%%%%%%%%%%% main_2a.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Separate the objects from the original and rotated image 
%      respectively
%      Calculate the Un, fn and H for each objects and get the most complex
%      object
%      Calculate the distance between the original and rotated objects and
%      get the matching objects
%
% Input Variables:
%      match       Input image 'match1'
%      match3      Input image 'match3' 
%      
% Returned Results:
%      output(a)_i_1 - 4     The plot of U(n) and f(n) for original objects
%      table 1 (command window) The shape complexity H(X|B) for the objects
%      table 2 (command window) The distance between 'match3' and 'match1' 
%
% Processing Flow:
%      1.  Load in the 'match1' image
%      2.  Create 3 * 3 square SE
%      3.  Separate the four objects from the original image and resize
%      them
%      4.  Calculte Un, fn, H for each objects
%      5.  Load in the 'match3' image
%      6.  Separate the four objects from the rotated image and resize
%      them
%      7.  Calculte the distance between the original and rotated objects
%          
% Restrictions/Notes:
%      1. Background pixels are 0s, while Foreground pixels are 1s.
%      2. The result tables of the H and distance are displayed in the 
%      command window
%
% The following functions are called:
%      zero.m       generate image full of zeros 
%      resize.m     using dilate operation to resize the image 
%      cal_ufh.m    calculate Un, fn and H for the objects
%      cal_d.m      calculate the distance between objects
%
%  Author:      Fan Yang
%  Date:        2/17/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clean windows, workspace, etc
clear;
close all;
clc;

% Creat a folder for output results
mkdir 'output_2'

%% Part (i)

% Read in the image 
match = imread('Input\match1.gif');
match = double(match);

% Create the 3 * 3 square SE with all values = 1
se = zero(3, 3) + 1;

% Separate the four objects from the image
obj1 = match(20 : 110, 40 : 115); % clover
obj2 = match(20 : 110, 120 : 190); % spade
obj3 = match(110 : 210, 40 : 120); % steer
obj4 = match(110 : 210, 110 : 200); % airplane

% Enlarge the obj images into same size
% Create a zero matrix (resize_element) with the same size to assist this 
% operation
re = zero(size(match, 1) / 2, size(match, 1) / 2);
obj1 = resize(re, obj1);
obj2 = resize(re, obj2);
obj3 = resize(re, obj3);
obj4 = resize(re, obj4);

% Use function to calculte Un, fn, H for the objects
[Un1, fn1, H1, n1] = cal_ufh(obj1, se);
[Un2, fn2, H2, n2] = cal_ufh(obj2, se);
[Un3, fn3, H3, n3] = cal_ufh(obj3, se);
[Un4, fn4, H4, n4] = cal_ufh(obj4, se);

% Show the U(n) and f(n) of these four objects
figure(1);
subplot(1,2,1);
scatter(0: 1: n1 - 1, Un1(1: n1)), ...
    xlabel('n'), ylabel('U(n)'), title('Size distribution of object1 (clover)')
subplot(1,2,2);
scatter(0: 1: n1 - 1, fn1(1: n1)), ...
    xlabel('n'), ylabel('f(n)'), title('Pattern pectrum of object1 (clover)')
saveas(figure(1), 'output_2\output(a)_i_1', 'png');

figure(2);
subplot(1,2,1);
scatter(0: 1: n2 - 1, Un2(1: n2)), ...
    xlabel('n'), ylabel('U(n)'), title('Size distribution of object2 (spade)')
subplot(1,2,2);
scatter(0: 1: n2 - 1, fn2(1: n2)), ...
    xlabel('n'), ylabel('f(n)'), title('Pattern pectrum of object2 (spade)')
saveas(figure(2), 'output_2\output(a)_i_2', 'png');

figure(3);
subplot(1,2,1);
scatter(0: 1: n3 - 1, Un3(1: n3)), ...
    xlabel('n'), ylabel('U(n)'), title('Size distribution of object3 (steer)')
subplot(1,2,2);
scatter(0: 1: n3 - 1, fn3(1: n3)), ...
    xlabel('n'), ylabel('f(n)'), title('Pattern pectrum of object3 (steer)')
saveas(figure(3), 'output_2\output(a)_i_3', 'png');

figure(4);
subplot(1,2,1);
scatter(0: 1: n4 - 1, Un4(1: n4)), ...
    xlabel('n'), ylabel('U(n)'), title('Size distribution of object4 (airplane)')
subplot(1,2,2);
scatter(0: 1: n4 - 1, fn4(1: n4)), ...
    xlabel('n'), ylabel('f(n)'), title('Pattern pectrum of object4 (airplane)')
saveas(figure(4), 'output_2\output(a)_i_4', 'png');

% Show the H(X|B) of the four objects
fprintf('The shape complexity H(X|B) for the objects are:\n')
fprintf('Clover: %f\nSpade: %f\nSteer: %f\nAirplane: %f\n', H1, H2, H3, H4)


%% Part (ii)

% Read in the image 
match3 = imread('match3.gif');
match3 = double(match3);

% Separate the four rotated objects from the image
obj1_r = match3(20 : 110, 55 : 120);
obj2_r = match3(20 : 110, 130 : 200);
obj3_r = match3(115 : 215, 55 : 135);
obj4_r = match3(110 : 220, 130 : 205);

% Enlarge the obj images into same size
obj1_r = resize(re, obj1_r);
obj2_r = resize(re, obj2_r);
obj3_r = resize(re, obj3_r);
obj4_r = resize(re, obj4_r);

% Use function to calculte pattern pectrum fn for the objects
[Un1_r, fn1_r] = cal_ufh(obj1_r, se);
[Un2_r, fn2_r] = cal_ufh(obj2_r, se);
[Un3_r, fn3_r] = cal_ufh(obj3_r, se);
[Un4_r, fn4_r] = cal_ufh(obj4_r, se);

% Use function to calculete the distance between objects in match3.gif and 
% match1.gif
[d1, d2, d3, d4] = cal_d(fn1, fn2, fn3, fn4, fn1_r, fn2_r, fn3_r, fn4_r);

% Print distance table
d = [d1; d2; d3; d4];

T = array2table(dlarray(d),...
    'VariableNames',{'clover','spade','steer','airplane'}, ...
    'RowNames',{'object 1','object 2','object 3','object 4'});
fprintf('The value of distance between "match3" and "match1":\n')
disp(T)


