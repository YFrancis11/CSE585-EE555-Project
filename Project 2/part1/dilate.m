
% dilate: do dilation
function [im2] = dilate(im, B)
    im2 = ones(size(im), 'logical');

    [y, x] = size(im);
    [m, n] = size(B);

    cutoff = (m-1)/2;

    % loop through all elements in the image (no borders)
    for i = 1+cutoff : y-cutoff
        for j = 1+cutoff : x-cutoff
            % check whether B_z is hitting the image.
            if is_hit(im, B, i, j)
                im2(i, j) = 0; % set to 0 (foreground)
            else
                im2(i, j) = 1; % set to 1 (background)
            end
        end
    end
end

