function [C B]=cryptimg(I)
I=rgb2gray(I);
[n m]=size(I);
for i=1:n
    for j=1:m
        if I(i,j)<128
        B(i,j)=I(i,j)+128;
        else 
            val=I(i,j)-128;
            B(i,j)=val;
        end
    end
end
B;
C=B;
for i=1:n/2
    for j=1:m
      C(i,j)=B(i+n/2,j);
    end
end
for i=n/2+1:n
    for j=1:m
      C(i,j)=B(i-n/2,j);
    end
end
C;
end