%%%%%%%%%%%%%  Function anisotropic %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 3x3 Anisotropic diffusion filter at each pixel in an image 
%
% Input Variables:
%      I       MxN input 2D gray-scale image to be filtered
%      k       parameter which affect g(.)
%      n       iteration time
%      g       parameter that decide the choices for g(.). For g = 1, we
%      use exponential function, otherwise, we use inverse quadratic
%
% Returned Results:
%      res     new image cantaining the filtered results
%
% Processing Flow:
%      1.  Get the size of input image and apply zero padding 
%      2.  For each valid pixel, use the N, S, E, W neighbor pixels and
%      calculate the new I^{t+1}_{i,j}
%
% Restrictions/Notes:
%      None 
%
% The following functions are called:
%      zero.m       generate image full of zeros
%      gfunc.m      function that determine the type of g(.) 
%  
%  Author:      Fan Yang
%  Date:        3/25/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [res] = anisotropic(I, k, n, g)

% Get the size of input and generate a background with the same size
[M, N] = size(I);
res = zero(M, N);

% Pick lambda = 0.25
lambda = 0.25;

% Use neighbor pixels to calculate the new pixel value
for x = 1 : n
    pad = zero(M + 2, N + 2);
    pad(2 : 2 + M - 1, 2 : 2 + N - 1) = I;
    for i = 2 : M + 1
        for j = 2 : N + 1
        neighbor = (gfunc((pad(i, j + 1) - pad(i, j)), k, g) * (pad(i, j + 1) - pad(i, j)) + gfunc((pad(i, j -1 ) - pad(i, j)), k, g) * (pad(i, j - 1) - pad(i, j)) + gfunc((pad(i + 1, j) - pad(i, j)), k, g) * (pad(i + 1, j) - pad(i, j)) + gfunc((pad(i - 1, j) - pad(i, j)), k, g) * (pad(i - 1, j) - pad(i, j)));
        I(i - 1, j - 1) = pad(i, j) + lambda * neighbor;
        end
    end
    I = round(I);
end
res = I;

end