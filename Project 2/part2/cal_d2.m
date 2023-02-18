%%%%%%%%%%%%% Function cal_d2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Calculate the distance between objects in original image and objects 
%     in rotated image
%
% Input Variables:
%      fn1 - fn4        Pattern spectrum of object 1 to 4 in original image
%      fn1_r - fn4_r    Pattern spectrum of object 1 to 4 in rotated image
%
% Returned Results:
%      d1 - d4          Distance between the original objects and rotated
%                       objects
%
% Processing Flow:
%      1.  Create all-one-matrix x
%      2.  Calculate the distence between objects
%          
% Restrictions/Notes:
%      1.  Background pixels are 0s, while Foreground pixels are 1s.
%      2.  For object 2 and object 3, change the matrix x to a smaller 
%          value to get the distance
%
% The following functions are called:
%      zero.m       generate image full of zeros 
%
%  Author:      Fan Yang
%  Date:        2/17/2023 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [d1, d2, d3, d4] = cal_d2(fn1, fn2, fn3, fn4, fn1_r, fn2_r, fn3_r, fn4_r)
    
    % Create all-one-matrix x, which has same size with fn
    x1 = zero(1, 20) + 1;
    x2 = zero(1, 20) + 1;
    x3 = zero(1, 20) + 1;
    x4 = zero(1, 20) + 1;
    
    % Change the matrix x for object 2 and 3 to calculate their distances 
    k2 = abs(fn2_r - fn2);
    for i =1 : 20
        if k2(i) > 0.1
           x2(i) = 0.001;
        end
    end
    
    k3 = abs(fn1_r - fn3);
    for i =1 : 20
        if k3(i) > 0.1
           x3(i) = 0.001;
        end
    end
    
    % Calculate the distence between objects
    d1 = zero(1, 4);
    d2 = zero(1, 4);
    d3 = zero(1, 4);
    d4 = zero(1, 4);
    
    d1(1,1) = (sum(x1 .* (fn1_r - fn1) .* (fn1_r - fn1))) ^ 0.5;
    d1(1,2) = (sum(x1 .* (fn2_r - fn1) .* (fn2_r - fn1))) ^ 0.5;
    d1(1,3) = (sum(x1 .* (fn3_r - fn1) .* (fn3_r - fn1))) ^ 0.5;
    d1(1,4) = (sum(x1 .* (fn4_r - fn1) .* (fn4_r - fn1))) ^ 0.5;
    
    d2(1,1) = (sum(x2 .* (fn1_r - fn2) .* (fn1_r - fn2))) ^ 0.5;
    d2(1,2) = (sum(x2 .* (fn2_r - fn2) .* (fn2_r - fn2))) ^ 0.5;
    d2(1,3) = (sum(x2 .* (fn3_r - fn2) .* (fn3_r - fn2))) ^ 0.5;
    d2(1,4) = (sum(x2 .* (fn4_r - fn2) .* (fn4_r - fn2))) ^ 0.5;
    
    d3(1,1) = (sum(x3 .* (fn1_r - fn3) .* (fn1_r - fn3))) ^ 0.5;
    d3(1,2) = (sum(x3 .* (fn2_r - fn3) .* (fn2_r - fn3))) ^ 0.5;
    d3(1,3) = (sum(x3 .* (fn3_r - fn3) .* (fn3_r - fn3))) ^ 0.5;
    d3(1,4) = (sum(x3 .* (fn4_r - fn3) .* (fn4_r - fn3))) ^ 0.5;
    
    d4(1,1) = (sum(x4 .* (fn1_r - fn4) .* (fn1_r - fn4))) ^ 0.5;
    d4(1,2) = (sum(x4 .* (fn2_r - fn4) .* (fn2_r - fn4))) ^ 0.5;
    d4(1,3) = (sum(x4 .* (fn3_r - fn4) .* (fn3_r - fn4))) ^ 0.5;
    d4(1,4) = (sum(x4 .* (fn4_r - fn4) .* (fn4_r - fn4))) ^ 0.5;
    
    
end
