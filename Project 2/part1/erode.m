
% erode: do erosion

function [im2] = erode(im, B, use_one_or_zero)
    im2 = ones(size(im), 'logical');

    [y, x] = size(im);
    [m, n] = size(B);
    cutoff = (m-1)/2;

    % loop through all elements in the image (no borders)
    for i = 1+cutoff : y-cutoff
        for j = 1+cutoff : x-cutoff
            % check whether B_z is included in the image.
            if is_include(im, B, i, j, use_one_or_zero)
                im2(i, j) = 1; % set to 1 (foreground)
            else
                im2(i, j) = 0; % 0 for white
            end
        end
    end
end


