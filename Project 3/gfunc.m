%%%%%%%%%%%%%  Function gfunc %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Function to decide the tpye of g(.)
%
% Input Variables:
%      I       norm of gradient of I
%      k       a parameter comparable to edge strength ||I||
%      n       parameter that decide the choices for g(.). For n = 1, we
%      use exponential function, otherwise, we use inverse quadratic
%
% Returned Results:
%      g       the result of g(.)
%
% Processing Flow:
%      1.      For n = 1, use exponential function to calculate g(.).
%      Otherwise, we use inverse quadratic to calculate g(.).
%
% Restrictions/Notes:
%      None 
%
% The following functions are called:
%      None
%  
%  Author:      Fan Yang
%  Date:        3/25/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function g = gfunc(I, k, n)
    % Judge the tpye if g(.) and calculate the output
    if n == 1
    g = exp(-(abs(I) / k) ^ 2);
    else 
    g = 1 / (1 + (abs(I) / k) ^ 2);
    end

end
