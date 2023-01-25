
% is_include: check if SE is included in X
function [include] = is_include(im, B, x, y)

    [h, w] = size(B);

    include = true;

    r = (h ) /2 ; % h+1

    for i = 1: h
        for j = 1 : w
            if B(i, j) == 1
                include = include & ~im(x + i-r, y + j-r);
            end
        end
    end

end







