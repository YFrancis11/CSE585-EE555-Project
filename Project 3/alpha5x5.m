%%%%%%%%%%%%%  Function alpha5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 5X5 alpha-trimmed mean filter at each pixel in an image 
%
% Input Variables:
%      I       MxN input 2D gray-scale image to be filtered
%      a       alpha - parameter that decide "trim" value
%
% Returned Results:
%      res     new image cantaining the filtered results
%
% Processing Flow:
%      1.  Get the size of input image and apply zero padding
%      2.  For each valid pixel, rank the order and trim highest and lowest 
%      values 
%      3.  Get the average points and assign as yk
%
% Restrictions/Notes:
%      None 
%
% The following functions are called:
%      zero.m
%  
%  Author:      Fan Yang
%  Date:        3/24/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [res] = alpha5x5(I, a)

% Get the size of input and generate a pad matrix with larger size
[M, N] = size(I);
pad = zero(M + 4, N + 4);
pad(3 : 3 + M - 1, 3 : 3 + N - 1) = I;

% Generate block and bar matrices
block = zero(5, 5);
bar = zero(1, 25);
res = zero(M, N);

% Compute the output image by using alpha-trimmed mean filter equation
for i = 3 : 3 + M - 1
    for j = 3 : 3 + N - 1
        % Applying zero padding operation and ranking order
        block = pad(i - 2 : i + 2, j - 2 : j + 2);
        for x = 1 : 5
            for y = 1 : 5
                bar((x - 1) * 5 + y) = block(x, y);
            end
        end
        bar = sort(bar);
        num = floor(a * 25);
        % Calculate average value
        res(i - 2, j - 2) = sum(bar(num + 1 : 25 - num)) / (25 - num * 2);
    end
end
    res = round(res);

end

