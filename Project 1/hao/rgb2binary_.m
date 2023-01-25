%%%%%%%%%%%%%  Function rgb2binary_ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      convert a rbg to a binary
%

function [imb] = rgb2binary_(im)

    % first to gray image first
    imb = rgb2gray(im);
    [y, x] = size(imb);

    % set a threshold to make it binary
    thre = 70;
    for i = 1:x
        for j =1:y
            % bigger than thre, then set to black, otherwise, white
            if imb(j,i) >= thre
                imb(j,i) = 255;
            else
                imb(j, i) = 0; 
            end
        end
    end
    imb = logical(imb);
%     imtool(imb);
end