function I=median(I)
[n m]=size(I);
for i=2:n-2
for j=2:m-2
    s=1;
    d=zeros(1,9);
    for q=i-1:i+1
       for p=j-1:j+1
         d(s)=I(q,p);
            s=s+1;
      end
    end 
    add=sort(d);
    I(i,j)=add(5);
end    
end
I;
end




