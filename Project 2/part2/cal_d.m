%%%%%%%%%%%%% Function cal_d %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Calculate the distance between objects in 'match3' and objects in
%     'match1'
%
%  Date:        2/16/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [d1, d2, d3, d4] = cal_d(fn1, fn2, fn3, fn4, fn1_r, fn2_r, fn3_r, fn4_r)
    
    % Create all-one-matrix x, which has same size with fn
    x1 = zero(1,20,1) + 1;
    x2 = zero(1,20,1) + 1;
    x3 = zero(1,20,1) + 1;
    x4 = zero(1,20,1) + 1;
    
    % For object_2, because their difference is small, we change the matrix
    % x to a small value to get the distance 
    k = abs(fn2_r - fn2);
    for i = 1 : 20
        if k(i) > 0.1
           x2(i) = 0.001;
        end
    end
    
    % Calculate the distence between objects
    d1 = zero(1,4,1);
    d2 = zero(1,4,1);
    d3 = zero(1,4,1);
    d4 = zero(1,4,1);
    
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
