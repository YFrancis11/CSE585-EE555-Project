%%%%%%%%%%%%% Function resize %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Function of doing dilate operation to resize the image
%
% Input Variables:
%      re       Target size to adjust
%      obj      Target object to resize 
%      
% Returned Results:
%      obj     The resized image
%
% Processing Flow:
%      1.  Compare the size between the two input variables
%      2.  Resize the object to the size of re by enlagring the background
%      area
%          
% Restrictions/Notes:
%      1. Background pixels are 0s, while Foreground pixels are 1s.
%      2. This function can resize the image without changing the size of
%      the object, that is, it will not affect the size of the object
%
% The following functions are called:
%      zero.m       generate image full of zeros 
%
%  Author:      Fan Yang
%  Date:        2/17/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [obj] = resize(re, obj)

    [y, x] = size(re);
    [m, n] = size(obj);

    % Check whether the size of re is greater than that of obj
    if (y > m && x > n)
        % Enlarge the obj to the size of re
        enlarge = zero(y, x);
        y_ = 1 + ceil(y / 2 - m / 2);
        y_m = 1 + ceil(y / 2 - m / 2) + m - 1;
        x_ = 1 + ceil(x / 2 - n / 2);
        x_n = 1 + ceil(x / 2 - n / 2) + n - 1;

        enlarge(y_: y_m, x_: x_n) = obj;
        obj = enlarge;
    end

end
        
    
