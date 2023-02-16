
% skeletonization for im using B
% return:
%   x: a list of images
function [x] = skeletonization(im, B)

    i = 1;
    x(:,:,i) = im;

    % do the operation once before going into a while loop
    % because of the condition in the loop
    i = i + 1 ;
    x(:,:,i) = x(:,:,i-1);
    for j = 1:8
        x(:,:,i) = diff_hit_or_miss(x(:,:,i), B(:,:,j));
    end


    while (~isequal(x(:,:,end), x(:,:,end-1)))
        i = i + 1 ;
        x(:,:,i) = x(:,:,i-1);
        for j = 1:8
            x(:,:,i) = diff_hit_or_miss(x(:,:,i), B(:,:,j));
        end
    end

end