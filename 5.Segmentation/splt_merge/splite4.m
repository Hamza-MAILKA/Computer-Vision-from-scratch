function I=splite4(I,Th)
w=2;n=4;
T=max(max(I))-min(min(I));
if T<Th
   I(1:n,1:n)=ceil(mean(mean(I(1:n,1:n))));
 
else
M1=split2(I(1:w,1:w),Th);
M2=split2(I(w+1:n,1:w),Th);
M3=split2(I(1:w,w+1:n),Th);
M4=split2(I(w+1:n,w+1:n),Th);
I1=cat(1,M1,M2);
I2=cat(1,M3,M4);
I=cat(2,I1,I2);
I=merge(I,Th);
end
end


