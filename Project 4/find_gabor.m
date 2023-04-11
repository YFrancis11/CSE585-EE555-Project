%%%
% Args:
%   F, theta, and sigma
% Return:
%   a GEF with a width 4*sigma+1 for x and y axis because sigma_x = sigma_y
%%%

function [h_x, h_y] = find_gabor(F, theta, sigma)
    g = zeros( 4*sigma + 1, 1);
    h_x = zeros( 4*sigma + 1, 1);
    h_y = zeros( 4*sigma + 1, 1);
    for i = 1 : 4*sigma+1 %-2*sigma:2*sigma
        x = i - (2 * sigma + 1);
        g(i, 1) = 1/(2 * pi * sigma * sigma) * (exp((-x*x) / (2*sigma*sigma) ));
        h_x(i, 1) = g(i, 1) * exp( 1i * 2 * pi * F * x * cos(theta)) ;
        h_y(i, 1) = g(i, 1) * exp( 1i * 2 * pi * F * x * sin(theta)) ;
    end
    
end