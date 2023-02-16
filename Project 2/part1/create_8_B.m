
% create_8_B: return an array of SEs.

function [B] = create_8_B()

B = zeros(3,3,8);



%%%% B1 %%%%%
f = ones(3,3);
% ignore pixels
f(2,1) = 2; 
f(2,3) = 2;

for i = 1:3
    for j = 1:3
        if (i == 1 & j == 1) || (i == 1 & j == 2) || (i == 1 & j == 3)
            f(i,j) = 0; % set to background
        end
    end
end
B(:,:,1) = f;





%%%% B2 %%%%%
f = ones(3,3);
% ignore pixels
f(1,1) = 2; 
f(3,3) = 2;

for i = 1:3
    for j = 1:3
        if (i == 1 & j == 2) || (i == 1 & j == 3) || (i == 2 & j == 3)
            f(i,j) = 0; % set to background
        end
    end
end
B(:,:,2) = f;





%%%% B3 %%%%%
f = ones(3,3);
% ignore pixels
f(1,2) = 2; 
f(3,2) = 2;

for i = 1:3
    for j = 1:3
        if (i == 1 & j == 3) || (i == 2 & j == 3) || (i == 3 & j == 3)
            f(i,j) = 0; % set to background
        end
    end
end
B(:,:,3) = f;




%%%% B4 %%%%%
f = ones(3,3);
% ignore pixels
f(3,1) = 2; 
f(1,3) = 2;

for i = 1:3
    for j = 1:3
        if (i == 2 & j == 3) || (i == 3 & j == 3) || (i == 3 & j == 2)
            f(i,j) = 0; % set to background
        end
    end
end
B(:,:,4) = f;









%%%% B5 %%%%%
f = ones(3,3);
% ignore pixels
f(2,1) = 2; 
f(2,3) = 2;

for i = 1:3
    for j = 1:3
        if (i == 3 & j == 1) || (i == 3 & j == 2) || (i == 3 & j == 3)
            f(i,j) = 0; % set to background
        end
    end
end
B(:,:,5) = f;





%%%% B6 %%%%%
f = ones(3,3);
% ignore pixels
f(1,1) = 2; 
f(3,3) = 2;

for i = 1:3
    for j = 1:3
        if (i == 2 & j == 1) || (i == 3 & j == 1) || (i == 3 & j == 2)
            f(i,j) = 0; % set to background
        end
    end
end
B(:,:,6) = f;





%%%% B7 %%%%%
f = ones(3,3);
% ignore pixels
f(1,2) = 2; 
f(3,2) = 2;

for i = 1:3
    for j = 1:3
        if (i == 1 & j == 1) || (i == 2 & j == 1) || (i == 3 & j == 1)
            f(i,j) = 0; % set to background
        end
    end
end
B(:,:,7) = f;




%%%% B8 %%%%%
f = ones(3,3);
% ignore pixels
f(3,1) = 2; 
f(1,3) = 2;

for i = 1:3
    for j = 1:3
        if (i == 1 & j == 1) || (i == 1 & j == 2) || (i == 2 & j == 1)
            f(i,j) = 0; % set to background
        end
    end
end
B(:,:,8) = f;









end


