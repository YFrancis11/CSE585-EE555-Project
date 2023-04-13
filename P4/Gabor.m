function m = Gabor(I,F,sigma,theta)
[row,col] = size(I);
[gx gy] = gaussian(sigma);

for i = -2*fix(sigma):2*fix(sigma)
      hx(2*fix(sigma)+i+1,1) = gx(2*fix(sigma)+i+1,1)*exp(1i*2*pi*F*i*cos(theta)); 
      hy(1,2*fix(sigma)+i+1) = gy(1,2*fix(sigma)+i+1)*exp(1i*2*pi*F*i*sin(theta)); 
   
end

for i = 1:col
    for j = 2*fix(sigma)+1:row-2*fix(sigma)
        block = I(j-2*fix(sigma):j+2*fix(sigma),i); 
        I1(j-2*fix(sigma),i) = sum(flipud(block).*hx);
    end
end

[row1,col1] = size(I1);
for i = 1:row1
    for j = 2*fix(sigma)+1:col1-2*fix(sigma)
        block = I1(i,j-2*fix(sigma):j+2*fix(sigma));
        I2(i,j-2*fix(sigma)) = abs(sum(fliplr(block).*hy));
    end
end

m = I2;
end
