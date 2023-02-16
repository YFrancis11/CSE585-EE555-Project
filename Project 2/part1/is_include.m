
% is_include: check if SE is included in X
function [include] = is_include(im, B, x, y, use_one_or_zero)

    [h, w] = size(B);

    include = true;

    r = (h+1)/2 ;

    for i = 1: h
        for j = 1 : w
            % only consider valid elements in B 
            if B(i, j) == use_one_or_zero
                include = include & im(x + i-r, y + j-r);
%                 include = include & ~im(x + i-r, y + j-r);
            end
        end
    end

end







