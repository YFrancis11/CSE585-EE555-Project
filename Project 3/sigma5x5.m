%%%%%%%%%%%%%  Function sigma5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 5X5 sigma filter at each pixel in an image 
%
% Input Variables:
%      I       MxN input 2D gray-scale image to be filtered
%      s       sigma - parameter that decide range value
%
% Returned Results:
%      res     new image cantaining the filtered results
%
% Processing Flow:
%      1.  Get the size of input image and apply zero padding
%      2.  For each valid pixel, trim the value and select points +/- 2*s
%      of xk
%      3.  Get the average points and assign as yk
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

function [res] = sigma5x5(I, s)

% Get the size of input and generate a pad matrix with larger size and
% block matrix
[M, N] = size(I);
pad = zero(M + 4, N + 4);
pad(3 : 3 + M - 1, 3 : 3 + N - 1) = I;
block = zero(5, 5);
res = zero(M, N);

% Compute the output image by using sigma filter equation
for i = 3 : M + 2
    for j = 3 : N + 2
        % Applying zero padding operation and trim the value 
        block = pad(i - 2 : i + 2, j - 2 : j + 2);
        nc = 0; 
        for x = 1 : 5
            for y = 1 : 5
               % Determine delta_i
               if (abs(block(x, y) - block(3, 3)) >= 2 * s)
                   block(x, y) = 0;
                   nc = nc + 1;
               end
            end
        end
        % Calculate average value
        res(i - 2, j - 2) = sum(block(:)) / (25 - nc);
    end
end
    res = round(res);

end

