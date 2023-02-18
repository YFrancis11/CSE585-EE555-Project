%%%%%%%%%%%%% Function zero %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Set up an MxN image full of zeros - useful for dealing with
%      border effects
%
% Input Variables:
%      M, N    rows (M) and columns (N) in f
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      
% Returned Results:
%      fzero   new image full of all zeros
%
% Processing Flow:  
%      1.  Cycle through MxN array and fill with ZEROS
%
%  Restrictions/Notes:
%      1. This function takes an 8-bit image as input.
%      2. This function is from the 'zero.m' function on canvas
%
%  The following functions are called:
%      NONE
%
%  Author:      William E. Higgins
%  Date:        1/13/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [fzero] = zero(M, N)
for x = 1 : M        
    for y = 1 : N
            fzero(x, y) = 0;
    end
end