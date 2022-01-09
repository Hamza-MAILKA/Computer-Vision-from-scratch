function I=split2(I,Th)
T=max(max(I))-min(min(I));
[l c]=size(I);
if T<Th
    I(1:l,1:c)=ceil(mean(mean(I(1:l,1:c))));
else
    I=merge(I,Th);
end
end
