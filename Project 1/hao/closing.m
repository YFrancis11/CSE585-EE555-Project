
% closing: do closing operation


function [im2] = dilate(im, B)
    r = B.Dimensionality;
%     im2 = zeros(size(im), 'logical');
    im2 = im;

    [x, y] = size(im);
    for i = 1:x
        for j = 1:y
            if is_hit(im, B, i, j)
                im2(x, y) = 1;
            else
                im2(x, y) = 0;
            end
        end
    end
end




function [im2] = erode(im, B)
    r = B.Dimensionality;
    im2 = im;

    [x, y] = size(im);
    for i = 1:x
        for j = 1:y
            if is_include(im, B, i, j)
                im2(x, y) = 1;
            else
                im2(x, y) = 0;
            end
        end
    end
end


function [flag] = is_hit(im, B, i, j)
    
    

end


function [flag] = is_include(im, B, i, j)


end



