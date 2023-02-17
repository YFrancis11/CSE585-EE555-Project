%%%%%%%%%%%%% Function resize %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Function of resize operation
%
%
%
%  Date:        2/16/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [obj] = resize(re, obj)

    [y, x] = size(re);
    [m, n] = size(obj);

    % Check whether the size of re is greater than that of obj
    if (y > m && x > n)
        % Enlarge the obj to the size of re
        enlarge = zero(y, x, 1);
        y_ = 1 + ceil(y / 2 - m / 2);
        y_m = 1 + ceil(y / 2 - m / 2) + m - 1;
        x_ = 1 + ceil(x / 2 - n / 2);
        x_n = 1 + ceil(x / 2 - n / 2) + n - 1;

        enlarge(y_: y_m, x_: x_n) = obj;
        obj = enlarge;
    end

end
        
    
