%%%%%%%%%%%%%  Function mean5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 5X5 mean (neighborhood average) filter at each pixel in  
%      an image 
%
% Input Variables:
%      I       MxN input 2D gray-scale image to be filtered
%      
% Returned Results:
%      res     new image cantaining the filtered results
%
% Processing Flow:
%      1.  Set a new image full of ZEROS
%      2.  For each valid pixel, compute the mean of the 5x5 neighborhood 
%      about the pixel and assign this value to the mean image
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      zero.m       generate image full of zeros
%
%  Author:      William E. Higgins
%  Date:        1/13/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [res] = mean5x5(I)

% Get the size of input and generate a background with the same size
[M, N] = size(I);
fzero = zero(M, N);

% Fill the output image with zeroes first
for x = 1 : M        
    for y = 1 : N    
        res(x, y) = fzero(x, y);
    end
end

% Convert f to a 16-bit number, so we can do  sums > 255 correctly
g = uint16(I);

% Define the coordinate limits for pixels that can be properly processed by
% the 5*5 filter
xlo = 3;   % Can't process first column
xhi = M-2; % Can't process last  column
ylo = 3;   % Can't process first row
yhi = N-2; % Can't process last  row

% Compute the filtered output image
for x = xlo : xhi        % Don't consider boundary pixels that can't
    for y = ylo : yhi    %    be processed! 
        for i = -2 : 2
            for j = -2 : 2   
                res(x,y) = g(x-i,y-j) + res(x,y);
            end
        end
        res(x,y) = res(x,y) / 25.;
    end
end

% Convert back to an 8-bit image
res = uint8(res);