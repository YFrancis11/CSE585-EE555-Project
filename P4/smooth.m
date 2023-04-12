function res = smooth(I,sigma)
[row,col] = size(I);
[gx gy] = gaussian(sigma);

for i = 1:col
    for j = 2*fix(sigma)+1:row-2*fix(sigma)
        block = I(j-2*fix(sigma):j+2*fix(sigma),i); 
        I1(j-2*fix(sigma),i) = sum(sum(flipud(block).*gx));
    end
end

[row1,col1] = size(I1);
for i = 1:row1
    for j = 2*fix(sigma)+1:col1-2*fix(sigma)
        block = I1(i,j-2*fix(sigma):j+2*fix(sigma));
        I2(i,j-2*fix(sigma)) = sum(sum(fliplr(block).*gy));
    end
end

res = I2;
end
