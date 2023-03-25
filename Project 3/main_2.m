%%%%%%%%%%%%% main_2.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Using anisotropic diffusion to process images and save the results
%      and gray-sacle histogram
%      Plot the line y = 128 image and process the segmented image
%      By changing the parameters, explore the impact of the iteration, k 
%      and g(.) on the results
%
% Input Variables:
%      I           Input image 'cwheelnoise'
%      I2          Input image 'cameraman'
%
% Returned Results:
%      a_(num)_iterations       The plot after implement num times 
%                               iteration on 'cwheelnoise'
%      a_(num)_iterations_h     The histogram after implement num times 
%                               iteration on 'cwheelnoise'
%      a_iii                    The plot of line y = 128
%      a_iv                     The plot of segmented image
%      b_(num)_iterations       The plot after implement num times 
%                               iteration on 'cameraman'
%      c_i_k(num)               The plot to determine impact of different k
%                               on 'cwheelnoise'
%      c_ii_1_k50 and c_ii_1_k75  The plot to determine impact of 
%                                 different g(.) on 'cwheelnoise'
%      c_ii_2                   The plot to determine impact of different k
%                               and g(.) on 'cameraman'
%
% Processing Flow:
%      1.  Load in the images
%      2.  Use anisotropuic function to process the 'cwheelnoise' in 
%          different iteration
%      3.  Set the line y = 128 and plot the result
%      4.  Segment the image and plot the result
%      5.  Use anisotropuic function to process the 'cameraman' in 
%          different iteration
%      6.  Change the parameters and save the different result under 
%          different iteration, k and g(.)
%          
% Restrictions/Notes:
%      None
%
% The following functions are called:
%      anisotropic.m   Compute a 3x3 Anisotropic diffusion filter at each 
%                      pixel in an image  
%
%  Author:      Fan Yang
%  Date:        3/25/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clean windows, workspace, etc
clear;
close all;
clc;

% Creat a folder for output results
mkdir 'results\question_2'

%%  Question (a)
% Read in the image 
I = imread('cwheelnoise.gif');
I = double(I);

% Generate the gray-scale histogram for original image
imwrite(uint8(I), 'results\question_2\a_0_iterations.png');
figure(1);
[counts1, x1] = imhist(uint8(I),256);  
counts1 = counts1 / (256 * 256);
stem(x1, counts1), title('original gray-scale histogram');
saveas(figure(1), 'results\question_2\a_0_iterations_h', 'png');

% Run anisotropic diffusion, save the output image and the gray-scale 
% histogram
% 5 iterations
res_5 = anisotropic(I, 50, 5, 1);
imwrite(uint8(res_5), 'results\question_2\a_5_iterations.png');
figure(2)
[counts2, x2] = imhist(uint8(res_5), 256);  
counts2 = counts2 / (256 * 256);      
stem(x2, counts2), title('5 iterations gray-scale histogram');
saveas(figure(2), 'results\question_2\a_5_iterations_h', 'png');

% 20 iterations
res_20 = anisotropic(I, 50, 20, 1);
imwrite(uint8(res_20), 'results\question_2\a_20_iterations.png');
figure(3)
[counts3, x3] = imhist(uint8(res_20), 256);  
counts3 = counts3 / (256 * 256);      
stem(x3, counts3), title('20 iterations gray-scale histogram');
saveas(figure(3), 'results\question_2\a_20_iterations_h', 'png');

%100 iterations
res_100 = anisotropic(I, 50, 100, 1);
imwrite(uint8(res_100), 'results\question_2\a_100_iterations.png');
figure(4);
[counts4, x4] = imhist(uint8(res_100), 256);  
counts4 = counts4 / (256 * 256);  
stem(x4, counts4), title('100 iterations gray-scale histogram');
saveas(figure(4), 'results\question_2\a_100_iterations_h', 'png');

% As line y = 128, plot the result after 0, 5, 20, 100 iterations
figure(5);
subplot(2, 2, 1);
plot(uint8(I(:, 128))), title('0 iterations');
subplot(2, 2, 2);
plot(uint8(res_5(:,128))), title('5 iterations');
subplot(2, 2, 3);
plot(uint8(res_20(:,128))), title('20 iterations');
subplot(2, 2, 4);
plot(uint8(res_100(:,128))), title('100 iterations');
saveas(figure(5), 'results\question_2\a_iii', 'png');

% Segmented version of the image after 0, 5, 20, 100 iterations
SI = I;
Sres_5 = res_5;
Sres_20 = res_20;
Sres_100 = res_100;

for i = 1 : 256
    for j = 1 : 256
        if (SI(i, j) < 80 || SI(i, j)>110)
        SI(i, j) = 255;
        end
        if (Sres_5(i, j) < 80 || Sres_5(i, j) > 110)
        Sres_5(i, j) = 255;
        end
        if (Sres_20(i, j) < 80 || Sres_20(i, j) > 110)
        Sres_20(i, j) = 255;
        end
        if (Sres_100(i, j) < 80 || Sres_100(i, j) > 110)
        Sres_100(i, j) = 255;
        end
    end
end

figure(6);
subplot(2,2,1);
imshow(uint8(SI)), title('0 iteration')
subplot(2,2,2);
imshow(uint8(Sres_5)), title('5 iterations');
subplot(2,2,3);
imshow(uint8(Sres_20)), title('20 iterations');
subplot(2,2,4);
imshow(uint8(Sres_100)), title('100 iterations');
saveas(figure(6), 'results\question_2\a_iv', 'png');


%%  Question (b)
% Read in the image 
I2 = imread('cameraman.tif');
I2 = double(I2);

% Run anisotropic diffusion with 0, 5, 20, and 100 iterations respectively
% Then save the output result
res_5 = anisotropic(I2, 25, 5, 1);
res_20 = anisotropic(I2, 25, 20, 1);
res_100 = anisotropic(I2, 25, 100, 1);

imwrite(uint8(I2), 'results\question_2\b_0_iterations.png');
imwrite(uint8(res_5), 'results\question_2\b_5_iterations.png');
imwrite(uint8(res_20), 'results\question_2\b_20_iterations.png');
imwrite(uint8(res_100), 'results\question_2\b_100_iterations.png');


%%  Question (c)
% Determine the impact of different k on the results
% In this part, we set the iteration time as 100 times and calculate the 
% results with k = 25, 50 and 75 respectively
res_k25 = anisotropic(I, 25, 100, 1);
res_k50 = anisotropic(I, 50, 100, 1);
res_k75 = anisotropic(I, 75, 100, 1);

imwrite(uint8(res_k25), 'results\question_2\c_i_k25.png');
imwrite(uint8(res_k50), 'results\question_2\c_i_k50.png');
imwrite(uint8(res_k75), 'results\question_2\c_i_k75.png');


% Determine the impact of different g(.) on the results
% For the wheel image, as k = 50
res_g1 = anisotropic(I, 50, 100, 1);
res_g2 = anisotropic(I, 50, 100, 2);
Sres_g1 = res_g1;
Sres_g2 = res_g2;
for i = 1 : 256
    for j = 1 : 256
        if (Sres_g1(i, j) < 80 || Sres_g1(i, j) > 110)
        Sres_g1(i, j) = 255;
        end
        if (Sres_g2(i, j) < 80 || Sres_g2(i, j) > 110)
        Sres_g2(i, j) = 255;
        end
    end
end

figure(7);
subplot(2,2,1);
imshow(uint8(res_g1)), title('filtered and g(.) is exponential')
subplot(2,2,2);
imshow(uint8(Sres_g1)), title('segmented and g(.) is exponential');
subplot(2,2,3);
imshow(uint8(res_g2)), title('filtered and g(.) is inverse');
subplot(2,2,4);
imshow(uint8(Sres_g2)), title('segmented and g(.) is inverse');
saveas(figure(7), 'results\question_2\c_ii_1_k50', 'png');

% As k = 75
res_g1 = anisotropic(I, 75, 100, 1);
res_g2 = anisotropic(I, 75, 100, 2);
Sres_g1 = res_g1;
Sres_g2 = res_g2;
for i = 1 : 256
    for j = 1 : 256
        if (Sres_g1(i, j) < 80 || Sres_g1(i, j) > 110)
        Sres_g1(i, j) = 255;
        end
        if (Sres_g2(i, j) < 80 || Sres_g2(i, j) > 110)
        Sres_g2(i, j) = 255;
        end
    end
end

figure(8);
subplot(2,2,1);
imshow(uint8(res_g1)), title('filtered and g(.) is exponential')
subplot(2,2,2);
imshow(uint8(Sres_g1)), title('segmented and g(.) is exponential');
subplot(2,2,3);
imshow(uint8(res_g2)), title('filtered and g(.) is inverse');
subplot(2,2,4);
imshow(uint8(Sres_g2)), title('segmented and g(.) is inverse');
saveas(figure(8), 'results\question_2\c_ii_1_k75', 'png');

% For the cameraman image, as k = 50 and 75 respectively
res_g1 = anisotropic(I2, 50, 100, 1);
res_g2 = anisotropic(I2, 50, 100, 2);
res_g3 = anisotropic(I2, 75, 100, 1);
res_g4 = anisotropic(I2, 75, 100, 2);

figure(9);
subplot(2,2,1);
imshow(uint8(res_g1)), title('k = 50 and g(.) is exponential')
subplot(2,2,2);
imshow(uint8(res_g2)), title('k = 50 and g(.) is inverse');
subplot(2,2,3);
imshow(uint8(res_g3)), title('k = 75 and g(.) is exponential');
subplot(2,2,4);
imshow(uint8(res_g4)), title('k = 75 and g(.) is inverse');
saveas(figure(9), 'results\question_2\c_ii_2', 'png');

