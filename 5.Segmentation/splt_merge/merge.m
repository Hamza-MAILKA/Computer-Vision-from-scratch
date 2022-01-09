function B=merge(I,th)
[n m]=size(I);
B=zeros(n,m);
for i=1:n
for j=1:m-1
for p=j+1:m
    if (B(i,p)==0)
        if abs(I(i,p-1)-I(i,p))<=th
            T=max(I(i,p-1),I(i,p));
             B(i,p-1)=T;
             B(i,p)=T;
        else
            break
        end
     end
end
end
end
B;
for i=1:n-1
for j=1:m
for p=i+1:n
    if ((B(p-1,j)~=0) && abs(I(p-1,j)-I(p,j))<=th)
        B(p,j)=B(p-1,j);
    end
    if (B(p-1,j)==0)
        if abs(I(p-1,j)-I(p,j))<=th
             T=max(I(p-1,j),I(p,j));
             B(p-1,j)=T;
             B(p,j)=T;
        else
            break
        end
    end
end
end
end
B;

for i=1:n-1
for j=1:m-1
for p=i+1:n
    if ((B(p-1,p-1)~=0) && abs(I(p-1,p-1)-I(p,p))<=th)
        B(p,p)=B(p-1,p-1);
    end
    if (B(p-1,p-1)==0)
        if abs(I(p-1,p-1)-I(p,p))<=th
            T=max(I(p-1,p-1),I(p,p));
             B(p-1,p-1)=T;
             B(p,p)=T;
        else
            break
        end
    end
end
end
end
for i=1:n
    for j=1:m
        if B(i,j)==0
            B(i,j)=I(i,j);
        end
    end
end
B;
end