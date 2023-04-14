%%%%%%%%%%%%%  Function gauss %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute circularly-symmetric Gaussian 
%          
% Input Variables:
%      sigma       A real number which is used to calculate the guassian   
%      
%
% Returned Results:
%      gx     a 4sigma+1x1 matrix which is gaussian in x
%      gy     a 1x4sigma matrix which is gaussian in x
% Processing Flow:
%      1.  Initialize the two matrixs
%      2.  Use sigma and circularly-symmetric Gaussian formula to get two result matrixs
%
% Restrictions/Notes:
%      None 
%
% The following functions are called:
%      None
%
%  Date:        4/13/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [gx, gy] = gauss(sigma)
gx = zeros(4*sigma+1,1);
gy = zeros(1,4*sigma+1);
for i = -2*fix(sigma):2*fix(sigma)
        gx(2*fix(sigma)+i+1,1) = 1/(2*pi*sigma^2)*exp(-0.5*(i/sigma)^2);
        gy(1,2*fix(sigma)+i+1) = 1/(2*pi*sigma^2)*exp(-0.5*(i/sigma)^2);
end

end
