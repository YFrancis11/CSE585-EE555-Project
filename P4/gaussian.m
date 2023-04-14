%%%%%%%%%%%%%%%%  Function gaussian %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Calculate the circularly-symmetric Gaussian matrix
%
% Input Variables:
%      sigma      Guassian shape parameter
%
% Returned Results:
%      gx     the gaussian matrix with 4 * sigma + 1 height
%      gy     the gaussian matrix with 4 * sigma + 1 width
%
% Processing Flow:
%      1.  Using sigma to calculate the gaussian matrix
%
% Restrictions/Notes:
%      None 
%
% The following functions are called:
%      None 
%  
%  Author:      Hao Zhou, Fan Yang
%  Date:        4/13/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [gx, gy] = gaussian(sigma)

gx = zeros(4 * sigma + 1, 1);
gy = zeros(1, 4 * sigma + 1);

% Calculate the gaussian matrix
for i = -2 * fix(sigma) : 2 * fix(sigma)
    gx(2 * fix(sigma) + i + 1, 1) = 1 / (2 * pi * sigma ^ 2) * exp(-0.5 * (i / sigma) ^ 2);
    gy(1, 2 * fix(sigma) + i + 1) = 1 / (2 * pi * sigma ^ 2) * exp(-0.5 * (i / sigma) ^ 2);
end

end
