function [VM HM RM]=Mirror(I)
[n m]=size(I)
for i=1:n
    for j=1:m
        VM(i,j)=I(i,m-j+1);
    end
end
for i=1:n
    for j=1:m
        HM(i,j)=I(n-i+1,j);
    end
end
for i=1:n
    for j=1:m
        RM(i,j)=I(j,m-i+1);
    end
end
end
