
% hit_or_miss: perform hit or miss on an image to find objects whose radius
% is ~9 or ~ 31
% five sizes: ~9, ~11, ~21, ~28, ~31 based on imtool measurement.


function [im_] = hit_or_miss(im)
%     A = strel('disk', 11);
%     B = strel('disk', 51);
%     im1 = erode(im, A.Neighborhood);
%     im2 = erode(~im, ~B.Neighborhood);


    A = create_se(24,11);
    B = create_se(64,31);


    im1 = erode(im, A);
    im2 = erode(~im, ~B);
    im3 = ~(~im1 & ~im2);


% use built-in function to test A and B
% im3 = ~bwhitmiss(~im, A, ~B);



    % this is used to extend middle 3-sized circles to their original sizes
    [y,x] = size(im3);
    for r = 1:y
        for c = 1:x
            if im3(r,c) == 0
                for rr = -28:28 % 28 is because the second largest circle's radius is ~28
                    for cc = -28:28
                        if im(r+rr,c+cc) == 0
                            im3(r+rr,c+cc) = 0;
                        end
                    end
                end
            end
        end
    end

% set different between cleaned image and image with only middle 3-sized
% circles
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


