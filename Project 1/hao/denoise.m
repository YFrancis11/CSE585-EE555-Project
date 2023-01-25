%%%%%%%%%%%%% denoise %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      remove salt and peper noise using closing operatin

function [imc] = denoise(imb)
    % create a circle with r=3 inside a 5 by 5 square
    B = create_se(7, 3);
    %% closing
    imc = erode(dilate(imb, B), B);
end
