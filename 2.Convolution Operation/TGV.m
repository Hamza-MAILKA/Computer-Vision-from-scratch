function S=TGV(I)
I=double(I);
[n m]=size(I);
S=zeros(n,m);
for i=1:n
    for j=1:m
        offset_x = 16* sin(2 * pi * j/40);
        offset_y = 0;
        if i+offset_x < n
            val=uint16(i+offset_x);
            if val==0
                val=val+1;
            end
            S(i,j) = I(val,j);
        else
            S(i,j) = 0;
        end
    end
end
S=uint8(S);
end