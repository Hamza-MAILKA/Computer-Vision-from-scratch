function I=split32(A,Th)
n=16;I=A;r=2*n;
T=max(max(I))-min(min(I));
if T<Th
    I(1:r,1:r)=ceil(mean(mean(I(1:r,1:r))));
else
M1=split16(I(1:n,1:n),Th);
M2=split16(I(n+1:r,1:n),Th);
M3=split16(I(1:n,n+1:r),Th);
M4=split16(I(n+1:r,n+1:r),Th);
I1=cat(1,M1,M2);
I2=cat(1,M3,M4);
I=cat(2,I1,I2);
I=merge(I,Th);
end
end