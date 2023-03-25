%%%%%%%%%%%%%  Function symmetric5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 5×5 symmetric nearest-neighbor mean filter at each pixel 
%      in an image 
%
% Input Variables:
%      I       MxN input 2D gray-scale image to be filtered
%
% Returned Results:
%      res     new image cantaining the filtered results
%
% Processing Flow:
%      1.  Get the size of input image and apply zero padding
%      2.  For each valid pixel, select the most similar point for each 
%      pair of points symmetrically opposite each other
%      3.  Average together selected points and assign to xk,l
%
% Restrictions/Notes:
%      None 
%
% The following functions are called:
%      zero.m       generate image full of zeros
%  
%  Author:      Fan Yang
%  Date:        3/24/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [res] = symmetric5x5(I)

% Get the size of input and generate a pad matrix with larger size and
% block matrix
[M, N] = size(I);
pad = zero(M + 4, N + 4);
pad(3 : 3 + M - 1, 3 : 3 + N - 1) = I;
block = zero(5, 5);
res = zero(M, N);

% Compute the output image by applying symmetric nearest-neighbor mean 
% filter
for i = 3 : M + 2
    for j = 3 : N + 2
        % Applying zero padding operation and select the most similar pair
        block = pad(i - 2 : i + 2, j - 2 : j + 2);
        s = 0;
        c = 0;
        for x = -2 : 0
            for y = -2 : 2
                c = c + 1;
                if c >= 14
                s = s + 0;
                else
                    if(abs(block(3 + x, 3 + y) - block(3, 3)) < abs(block(3 - x, 3 - y) - block(3, 3)))
                    s = s + block(3 + x, 3 + y);
                    else
                    s = s + block(3 - x, 3 - y);   
                    end
                end
             end
        end
        res(i - 2, j - 2) = s / 13;
    end
end
    res = round(res);
    
end