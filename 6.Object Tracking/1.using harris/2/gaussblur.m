function J=gaussblur(I)
Q=[1 2 1;2 4 2; 1 2 1];
dim=sum(sum(Q));
[n m l]=size(I);
if l==3
    I=rgb2gray(I);
end
I=double(I);

for i=2:n-2
for j=2:m-2
    conv2d=0;
    k=1;
    l=1;
    for q=i-1:i+1
       for p=j-1:j+1
         conv2d=conv2d+I(q,p)*Q(l,k);
         l=l+1;
       end
      l=1;
      k=k+1;
    end 
    I(i,j)=conv2d/dim;
end    
end
J=uint8(I);
end