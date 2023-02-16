
% diff_hit_or_miss: perform hit or miss on an image  then do subtraction
% from im
% return:
%       im: result

function [im] = diff_hit_or_miss(im, B)

    % hit-or-miss
    % im3 = (X erode B^f) & (X^c erode B^b)
    im1 = erode(im, B, 1);
    im2 = erode(~im, B, 0);
%     im3 = ~(~im1 & ~im2);

    im4 = (im1 & im2);
    im = im & ~im4;


end


