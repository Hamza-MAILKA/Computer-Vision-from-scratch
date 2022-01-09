function I=split2(I)
T=max(max(I))-min(min(I));
[l c]=size(I);
if T<15
    I(1:l,1:c)=ceil(mean(mean(I(1:l,1:c))));
else
    I;
%     I1=I(1,1);
%     I2=I(1,2);
%     I3=(2,1);
%     I4=(2,2);
end
end
