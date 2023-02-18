%%%%%%%%%%%%% Function cal_ufh %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Calculate the size distribution Un, pattern pectrum fn and shape
%     complexity H of the object
%
% Input Variables:
%      im       Input image
%      B        Structuring element
%      
% Returned Results:
%      Un       Size distribution
%      fn       Pattern spectrum
%      H        Shape complexity
%      n        Number of component distribution 
%
% Processing Flow:
%      1.  Create space for the calculation of Un, fn and H
%      2.  Calculate U(1) by calculate the matrix sum of im, it is 
%      equivalent to calculating im opening by a 0 size SE
%      3.  Doing opening operation to calculate other U(n)
%      4.  Calculate the pattern spectrum fn
%      5.  Calculate the shape complexity H
%          
% Restrictions/Notes:
%      1.  Background pixels are 0s, while Foreground pixels are 1s.
%      2.  The matrix space used to store Un and fn is set to (1, 20), 
%      which can ensure that SE can doing opening operation correctly 
%      without exceeding the size of the object.
%
% The following functions are called:
%      zero.m       generate image full of zeros 
%
%  Author:      Fan Yang
%  Date:        2/17/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [Un, fn, H, n] = cal_ufh(im, B)

    % Create space for the calculation of Un fn and H
    se = B;
    Un = zero(1, 20);
    fn = zero(1, 20);
    H = 0;

    % Calculate the size distribution Un
    Un(1) = sum(sum(im));
    for i = 2 : length(Un)
        % Doing opening operation and calculate the area
        Un(i) = sum(sum(resize(im, dilate(erode(im, se), se))));
        se = dilate(se, B);
    end

    % Calculate the pattern spectrum fn
    n = sum(Un > 0);
    for i = 1 : n
        fn(i) = ((Un(i) - Un(i + 1)) / Un(1));
    end

    % Calculate the shape complexity H
    for i = 1 : n
        H = H - fn(i) * log(fn(i));
    end

end

