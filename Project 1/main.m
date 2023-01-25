clear all
close all
clc

% Read in the original image 
x = imread('RandomDisks-P10.jpg');

% Convert the RGB image into gray image and get its 2D dimensions
gray = rgb2gray(x);
imtool(gray);
imwrite(gray, 'gray.jpg');
[m, n] = size(gray);

% Creat initial matrix for the clean image
% Use the 3*3 mean filter to remove the salt-and-pepper noise and get the
% mean image
clean = zeros(m, n);
[img] = mean3x3(gray, clean, m, n);
imtool(img);
imwrite(img, 'mean.jpg');

% Implement the filter to get the true binary-valued image. Set the
% threshold value into 150, that is, for the value of each pixels, if it is
% greater than 150, then it will be set into 255, otherwise will be set
% into 0.
for i = 1:m
    for j = 1:n
        if(img(i,j)>=150)
            img(i,j) = 255;
        else
            img(i,j) = 0;
        end
    end
end
imtool(img);
imwrite(img, 'new_img.jpg');


% img = double(img / 255);