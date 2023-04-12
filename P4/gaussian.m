function [gx, gy] = gaussian(sigma)
gx = zeros(4*sigma+1,1);
gy = zeros(1,4*sigma+1);
for i = -2*fix(sigma):2*fix(sigma)
        gx(2*fix(sigma)+i+1,1) = 1/(2*pi*sigma^2)*exp(-0.5*(i/sigma)^2);
        gy(1,2*fix(sigma)+i+1) = 1/(2*pi*sigma^2)*exp(-0.5*(i/sigma)^2);
end

end
