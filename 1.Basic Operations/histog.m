function freq=histog(I)
[n,m]=size(I);
freq=zeros(256,1);
val=0;
for i=1:n
    for j=1:m
        val=I(i,j);
        freq(val+1)=freq(val+1)+1;
    end
end
end







