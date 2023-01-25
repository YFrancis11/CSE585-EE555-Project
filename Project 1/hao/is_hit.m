% is_hit: check if SE is hit to X

function [hit] = is_hit(im, B, x, y)
    [h, w] = size(B);
    hit = false;

    r = (h  ) /2 ; % +1

    for i = 1: h
        for j = 1 : w
            if B(i, j) == 1
                hit = hit | ~im(x + i-r, y + j-r);
            end
        end
    end
end



