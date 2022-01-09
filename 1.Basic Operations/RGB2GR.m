function C=RGB2G(I)
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
[n ,m ,l]=size(I);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  RGB2GRAY
for i=1:n
    for j=1:m
        C(i,j)=0.3*R(i,j)+0.59*G(i,j)+0.11*B(i,j);
    end   
end
C;
end