
% hit_or_miss: perform hit or miss on an image to find objects whose radius
% is ~9 or ~ 31
% five sizes: ~9, ~11, ~21, ~28, ~31 based on imtool measurement.


function [im_] = hit_or_miss(im)

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
    [y,x] = size(im3);
    for r = 1:y
        for c = 1:x
            if im3(r,c) == 0
                for rr = -extend_r:extend_r 
                    for cc = -extend_r:extend_r
                        if im(r+rr,c+cc) == 0
                            im3(r+rr,c+cc) = 0;
                        end
                    end
                end
            end
        end
    end

    % set different between cleaned image and image with only middle 3-sized circles
    im4 = ones(size(im));
    [y,x] = size(im4);
    for r = 1:y
        for c = 1:x
            if im(r,c) ~= im3(r,c)
                im4(r,c) = 0;
            end
        end
    end

    im_ = im4;
    

end


