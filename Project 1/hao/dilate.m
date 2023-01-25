
% dilate: do dilation

function [im2] = dilate(im, B)
%     r = B.Dimensionality;
    im2 = ones(size(im), 'logical');
%     im2 = im;

    [y, x] = size(im);
    [m, n] = size(B);
    cutoff = m/2; %(m-1)/2;
    for i = 1+cutoff : y-cutoff
        for j = 1+cutoff : x-cutoff
            if is_hit(im, B, i, j)
                im2(i, j) = 0;
            else
                im2(i, j) = 1;
            end
        end
    end
end

