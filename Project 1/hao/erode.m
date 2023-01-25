
% erode: do erosion

function [im2] = erode(im, B)
    im2 = ones(size(im), 'logical');

    [y, x] = size(im);
    [m, n] = size(B);
    cutoff = (m-1)/2;
    
    % loop through all elements in the image (no borders)
    for i = 1+cutoff : y-cutoff
        for j = 1+cutoff : x-cutoff
            % check whether B_z is included in the image.
            if is_include(im, B, i, j)
                im2(i, j) = 0; % set to 0 (foreground)
            else
                im2(i, j) = 1; % 1 for white
            end
        end
    end
end


