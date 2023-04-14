%%%%%%%%%%%%%%%%  Function smooth %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Apply a smoothing filter to the image 
%
% Input Variables:
%      I          Input image
%      sigma      Guassian shape parameter
%
% Returned Results:
%      m          The result matrix of image I
%
% Processing Flow:
%      1.  Get the size of input image and generate the gaussian matrices
%      2.  Calculate the convolution between input I and g(x,y) as the 
%          ouput m'(x,y)
%
% Restrictions/Notes:
%      None 
%
% The following functions are called:
%      gaussian.m       Calculate the Gaussian matrix
%  
%  Author:      Fan Yang
%  Date:        4/13/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function m2 = smooth(I, sigma)

%  Get the size of input image and generate the g(x,y)
[M, N] = size(I);
[gx, gy] = gaussian(sigma);

% Calculate the convolution  
for i = 1 : N
    for j = 2 * fix(sigma) + 1 : M - 2 * fix(sigma)
        block = I(j - 2 * fix(sigma) : j + 2 * fix(sigma), i); 
        I1(j - 2 * fix(sigma), i) = sum(sum(flipud(block) .* gx));
    end
end

[M1, N1] = size(I1);
for i = 1 : M1
    for j = 2 * fix(sigma) + 1 : N1 - 2 * fix(sigma)
        block = I1(i, j - 2 * fix(sigma) : j + 2 * fix(sigma));
        I2(i, j - 2 * fix(sigma)) = sum(sum(fliplr(block) .* gy));
    end
end

m2 = I2;
end
