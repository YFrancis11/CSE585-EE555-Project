%%%%%%%%%%%%%%%%  Function Gabor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Apply a Gabor filter to the image 
%
% Input Variables:
%      I          Input image
%      F          Center frequency
%      sigma      Guassian shape parameter
%      theta      Orientation of sinusoid in filter
%
% Returned Results:
%      m          The result matrix of image I
%
% Processing Flow:
%      1.  Get the size of input image and generate the gaussian matrices
%      2.  Using gaussian matrices g(x,y) to calculate the GEF h(x,y) 
%      3.  Calculate the convolution between input I and h(x,y) as the 
%          ouput m(x,y)
%
% Restrictions/Notes:
%      None 
%
% The following functions are called:
%      gaussian.m       Calculate the Gaussian matrix
%  
%  Author:      Hao Zhou, Fan Yang
%  Date:        4/13/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function m = Gabor(I, F, sigma, theta)

%  Get the size of input image and generate the g(x,y)
[M, N] = size(I);
[gx, gy] = gaussian(sigma);

% Calculate the h(x,y) 
for i = -2 * fix(sigma) : 2 * fix(sigma)
      hx(2 * fix(sigma) + i + 1, 1) = gx(2 * fix(sigma) + i + 1, 1) * exp(1i * 2 * pi * F * i * cos(theta)); 
      hy(1, 2 * fix(sigma) + i + 1) = gy(1, 2 * fix(sigma) + i + 1) * exp(1i * 2 * pi * F * i * sin(theta)); 
end

% Calculate the convolution  
for i = 1 : N
    for j = 2 * fix(sigma) + 1 : M - 2 * fix(sigma)
        block = I(j - 2 * fix(sigma) : j + 2 * fix(sigma), i); 
        I1(j - 2 * fix(sigma), i) = sum(flipud(block) .* hx);
    end
end

[M1, N1] = size(I1);
for i = 1 : M1
    for j = 2 * fix(sigma) + 1 : N1-2 * fix(sigma)
        block = I1(i, j - 2 * fix(sigma): j + 2 * fix(sigma));
        I2(i, j - 2 * fix(sigma)) = abs(sum(fliplr(block) .* hy));
    end
end

m = I2;
end
