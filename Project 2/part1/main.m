%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Homotopic Skeletonization 
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


mkdir 'results'


pic_name = 'bear'; % 'bear'

% read an image as binary image
im = logical(imread(strcat(pic_name, '.gif')));

% create 8 SE
B = create_8_B();


% grass-fire operations
result_im = skeletonization(im, B);




%%%%%%%%% save images as requsted 

len = size(result_im, 3);
save_array = sort([3, 6, 11, 100, len]);
for i = save_array
    if i > len % out of range
        break
    end

    name = strcat('results\', strcat(pic_name, strcat('x', strcat(int2str(i-1), '.png'))));
    imwrite(result_im(:,:,i), name);
    
    name = strcat('results\', strcat(pic_name, strcat('superpos', strcat(int2str(i-1), '.png'))));
    imwrite(im - result_im(:,:,i), name);

end



%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%