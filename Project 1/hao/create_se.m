% create_se is a function to create SE
% such that a circle resides in a square
% argument
%       size: the width of a square
%       radius: the radius of a circle in the square
%       
function [se] = create_se(size, radius)

    if size < radius || mod(size, 2) == 0 
        error('wrong size for the radius, and make sure size is odd for easier computations');
    end

    rows = size;
    cols = size;
    
    centerX = (cols+1)/2;
    centerY = (rows+1)/2;

    se = zeros(rows, cols, 'logical'); 
    
    for r = 1 : rows
        for c = 1:cols
            if (r - centerY)^2 + (c - centerX)^2 <= radius^2
                se(r,c) = 1;
            end
        end
    end

% imtool(se);