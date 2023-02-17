%%%%%%%%%%%%% Function cal_ufh %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Calculate the size distribution Un, pattern pectrum fn and shape
%     complexity H of the object
%
%
%
%  Date:        2/16/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [Un, fn, H, n] = cal_ufh(im, B)

    % Create space for the calculation of Un fn and H
    se = B;
    Un = zero(1, 20, 1);
    fn = zero(1, 20, 1);
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

