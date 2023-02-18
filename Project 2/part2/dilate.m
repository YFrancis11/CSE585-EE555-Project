%%%%%%%%%%%%% Function dilate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Function of dilate operation
%
% Input Variables:
%      im        Input image
%      B         Input SE
%      
% Returned Results:
%      im2       The shape of the dilation of im by B
%
% Processing Flow:
%      1.  Get the 2D dimensions of inputs
%      2.  Applying dilation operation
%          
% Restrictions/Notes:
%      1. Background pixels are 0s, while Foreground pixels are 1s.
%
% The following functions are called:
%      zero.m       generate image full of zeros 
%
%  Date:        2/17/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [im2] = dilate(im, B)

    B = transpose(B);

    % Get the 2D dimensions of inputs
    [y, x] = size(im);
    [m, n] = size(B);

    im2 = zero(y + floor(m / 2) * 2, x + floor(n / 2) * 2);
    border = zero(y + floor(m / 2) * 4, x + floor(n / 2) * 4);
    border(floor(m / 2) * 2 + 1 : floor(m / 2) * 2 + y, floor(n / 2) * 2 + 1 : floor(n / 2) * 2 + x) = im;

    % Applying dilation operation
    % Loop through all elements in the image
    for i = 1 : size(im2, 1)
        for j = 1: size(im2, 2)
            block = border(i : i + m - 1, j : j + n - 1);
            if (sum(sum(block .* B)) == 0)
                im2(i, j) = 0; % Set to 0 (background)
            else
                im2(i, j) = 1; % Set to 1 (foreground)
            end
        end
    end
    
end