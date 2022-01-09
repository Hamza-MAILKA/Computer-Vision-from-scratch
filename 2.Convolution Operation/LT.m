function I=LT(I)
[n m]=size(I);
Min=min(min(I))
Max=max(max(I))
for i=1:n
    for j=1:m
      I(i,j)=(255/(Max-Min))*(I(i,j)-Min);
%           I(i,j)=I(i,j)*(255-Min)/(Max-Min);
    end
end
I;
end


