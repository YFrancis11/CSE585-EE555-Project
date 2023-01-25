% clear;
% rows = 125;
% cols = 125;
% centerX = (cols+1)/2;
% centerY = (rows+1)/2;
% radius = (rows-1)/2;
% se = zeros(rows,cols, 'logical'); 
% 
% for r = 1:rows
%     for c =1:cols
%         if (r - centerY)^2 + (c - centerX)^2 <= radius^2
%             se(r,c) = 1;
%         end
%     end
% end
% 
% imtool(se);


    
% create_se is a function to create SE
% such that a circle resides in a square

function [se] = create_se(size, radius)
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