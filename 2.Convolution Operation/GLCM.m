function M=GLCM(I)
[n m]=size(I);
M=zeros(256,256);
for i=1:n
    for j=1:m
        val1=I(i,j);
        if i~=n
            if(j==m) 
               val2=I(i+1,1);
               M(val1+1,val2+1)=M(val1+1,val2+1)+1;
            else 
               val2=I(i,j+1);
               M(val1+1,val2+1)=M(val1+1,val2+1)+1;  
            end
         end
end
end
i=n;
    for j=1:m-1
            val2=I(i,j+1);
            M(val1+1,val2+1)=M(val1+1,val2+1)+1;
     end
M;
end
