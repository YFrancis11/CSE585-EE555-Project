% is_hit: check if SE is hit to X

function [hit] = is_hit(im, B, x, y)
    [h, w] = size(B);
    hit = false;

    % offset to make B = B^S
    r = (h + 1 )/2 ;

    for i = 1: h
        for j = 1 : w
            % only consider valid elements in B 
            if B(i, j) == 1
                hit = hit | ~im(x + i-r, y + j-r);
            end
        end
    end
end



