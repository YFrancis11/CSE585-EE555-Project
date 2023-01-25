
% hit_or_miss: perform hit or miss on an image to find objects whose radius
% is ~9 or ~ 31
% five sizes: ~9, ~11, ~21, ~28, ~31 based on imtool measurement.
% return:
%       im1: (X erode A)
%       im2: (X^c erode B^S)
%       im3: ~(~im1 & ~im2) %%takes ~ because foreground is 0
%       im4: extended im3 based on the second largest circle's radius (r=29)
%       im5: image with selected circles only

function [im1, im2, im3, im4, im5] = hit_or_miss(im)

    % create two SE
    % A is bigger than smallest circles
    % B is smaller than the biggest circles
    A = create_se(19,9);
    B = create_se(63,30);

    % hit-or-miss
    % im3 = (X erode A) & (X^c erode B^S)
    im1 = erode(im, A);
    im2 = erode(~im, ~B);
    im3 = ~(~im1 & ~im2);


    % this is used to extend middle 3-sized circles to their original sizes
    extend_r = 29; % the second largest circle's radius
    im4 = im3;
    [y,x] = size(im4);
    offset = 0; % not used
    for r = 1:y
        for c = 1:x
            % if encounter a foreground pixel, extend it based on the second largest circle's radius
            if im3(r,c) == 0
                for rr = -(extend_r-offset):extend_r+offset
                    for cc = -(extend_r-offset):extend_r+offset
                        if im(r+rr,c+cc) == 0 % && (rr - r)^2 + (cc - c)^2 <= extend_r^2
                            im4(r+rr,c+cc) = 0;
                        end
                    end
                end
            end
        end
    end

    % set different between cleaned image and image with only middle 3-sized circles
    im5 = ones(size(im));
    [y,x] = size(im5);
    for r = 1:y
        for c = 1:x
            if im(r,c) ~= im4(r,c)
                im5(r,c) = 0;
            end
        end
    end

end


