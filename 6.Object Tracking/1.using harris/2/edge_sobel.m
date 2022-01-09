function B=edge_sobel(I,T)
[n m l]=size(I);
if l==3
   I=rgb2gray(I); 
end
I= double(I);
KGx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
KGy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
for u = 2:n-2
         for v = 2:m-2
              sum1 = 0;
              sum2 = 0;           
              for i=-1:1
                for j=-1:1                  
                    sum1 = sum1 + I(u + i, v + j)* KGx(i + 2,j + 2);
                    sum2 = sum2 + I(u + i, v + j)* KGy(i + 2,j + 2);
                end
            end
            Filtered_X(u,v) = sum1;
            Filtered_Y(u,v) = sum2;
         end
end
magnitude = (Filtered_X.^2) + (Filtered_Y.^2);
magnitude2 = sqrt(magnitude);
B=magnitude2;
for i=1:n-2
    for j=1:m-2
      if B(i,j)>T
            B(i,j)=1;
      else B(i,j)=0;
      end
    end
end
% B=~B;
end