%%%%%%%%%%%%% Function erode %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Function of erode operation
%
% Input Variables:
%      im        Input image
%      B         Input SE
%      
% Returned Results:
%      im2       The shape of the erosion of im by B
%
%  Date:        2/16/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [im2] = erode(im, B)

    % Get the 2D dimensions of inputs
    [y, x] = size(im);
    [m, n] = size(B);

    k = sum(sum(B));
    im2 = zero(y, x, 1);
    border = zero(y + m - 1, x + n - 1, 1);
    border(floor(m / 2) + 1 : floor(m / 2) + y, floor(n / 2) + 1 : floor(n / 2) + x) = im;

    % Applying erosion operation
    % Loop through all elements in the image
    for i = 1 : y
        for j = 1 : x
            block = border(i : i + m - 1, j : j + n - 1);
            if (sum(sum(block .* B)) == k)
                im2(i, j) = 1;
            else
                im2(i, j) = 0;
            end
        end
    end

end