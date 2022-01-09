function I=splite4(I,w,n)
T=max(max(I))-min(min(I));
if T<15
   I(1:n,1:n)=ceil(mean(mean(I(1:n,1:n))));
 
else
M1=split2(I(1:w,1:w));
M2=split2(I(w+1:n,1:w));
M3=split2(I(1:w,w+1:n));
M4=split2(I(w+1:n,w+1:n));
I1=cat(1,M1,M2);
I2=cat(1,M3,M4);
I=cat(2,I1,I2);
end
end


