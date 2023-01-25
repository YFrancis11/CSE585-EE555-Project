%%%%%%%%%%%%%  Function denoise %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      remove salt and peper noise using closing operatin
%

function [imc] = denoise(imb)

    % create a 3 by 3 circle SE
%     B = strel("disk", 3);
    B = create_se(6, 3);

    %% opening/closing
    imc = erode(dilate(imb, B), B);
%     imc = imopen(imb, B);
%     imtool(imc);

end
