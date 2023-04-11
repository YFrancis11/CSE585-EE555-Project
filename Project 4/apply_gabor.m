%%%
% Args:
%   I, h_x, h_y
% Return:
%   filtered image m
%%%

function m = apply_gabor(I, h_x, h_y)
    sigma = (size(h_x, 1) - 1) / 4;
    
    I_x = zeros(size(I), 'double');
    I_y = I_x;

    x_l = 2*sigma + 1;
    x_r = size(I, 2) - 2*sigma;

    y_l = 2*sigma + 1;
    y_r = size(I, 1) - 2*sigma;

    for y = 1:size(I, 1)
        for x = x_l:x_r
            I_x(y, x) = conv1d(I(y, x-2*sigma: x+2*sigma), h_x, 'x');
        end
    end

    for x = 1:size(I, 2)
        for y = y_l:y_r
            I_y(y, x) = conv1d(I_x(y-2*sigma: y+2*sigma, x), h_y, 'y');
        end
    end

    m = abs(I_y(y_l:y_r, x_l:x_r));



end


%%%
% Args:
%   seq, f, direction
% Return:
%   return the result of conv1d of seq by f.
%%%
function r = conv1d(seq, f, direction)
    seq = double(seq);

    if strcmp(direction, 'x')
        seq = flip(seq, 2); % row vec (1, 33)
        r = sum(seq' .* f);
    end

    if strcmp(direction, 'y')
        seq = flip(seq, 1); % column vec (33, 1)
        r = sum(seq .* f);
    end


end



