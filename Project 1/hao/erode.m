
% erode: do erosion

function [im2] = erode(im, B)
%     im2 = im;
    im2 = ones(size(im), 'logical');

    [y, x] = size(im);
    [m, n] = size(B);
    cutoff = m/2;  %(m-1)/2;
    for i = 1+cutoff : y-cutoff
        for j = 1+cutoff : x-cutoff
            if is_include(im, B, i, j)
                im2(i, j) = 0; % 0 is black
            else
                im2(i, j) = 1; % 1 for white
            end
        end
    end
end


