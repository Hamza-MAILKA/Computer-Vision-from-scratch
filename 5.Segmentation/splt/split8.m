function I=split8(A)
s=2;n=2^s;
w=2;
I=A;
count=1;
n1=1;n2=4;n3=1;n4=4;r=2*n;
T=max(max(I))-min(min(I));
if T<15
    I(1:r,1:r)=ceil(mean(mean(I(1:r,1:r))));
else
for i=1:4
I=A(n1:n2,n3:n4);
I =splite4(I,w,n);
 if count==1
    I1=I;
    n1=n+1;
    n2=r;
 end
 if count==2
    I2=cat(1,I1,I);
    n1=1;
    n2=n;
    n3=n+1;
    n4=r;
 end
 if count==3
    I3=I;
    n1=n+1;
    n2=r;
    n3=n+1;
    n4=r;
 end
 if count==4
  I4=cat(1,I3,I);
  I=cat(2,I2,I4);
 end
count=count+1;
end
end
end