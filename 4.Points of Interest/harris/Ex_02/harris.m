function [R r]=hars(I,threshold)
[n m l]=size(I);
if l==3
    I = rgb2gray(I);
end
I=double(I);
%%% kernel de filtre gradient Ix,Iy
KGx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
KGy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
%%%%%% calcul de gradien Ix , Iy
for u = 2: n-2
         for v = 2:m-2
              sum1 = 0;
              sum2 = 0;           
              for i=-1:1
                for j=-1:1                  
                    sum1 = sum1 + I(u + i, v + j)* KGx(i + 2,j + 2);
                    sum2 = sum2 + I(u + i, v + j)* KGy(i + 2,j + 2);
                end
            end
            Ix(u,v) = sum1;
            Iy(u,v) = sum2;
         end
end
%%% calcul les coefficients de la Matrice M
Ix2 = Ix.*Ix;
Iy2 = Iy.*Iy;
Ixy = Ix.*Iy;



%%%%  calcul la somme de window w

s=1;
m=5;
m1=ceil(m/2);
b1 = size(Ix);
kh = 0.04;
for i=m1:b1(1)-m1              %% i ou j les indice pour toutes les éléments de l'images                          
    for j=m1:b1(2)-m1                                   
        p=1;                                     
        for k=1:m              %% k ou l les indice pour toutes les éléments de window w                             
            for l=1:m                                   
            Ix2c(p)=Ix2(i-m1+k,j-m1+l);                   
            Iy2c(p)=Iy2(i-m1+k,j-m1+l); 
            Ixyc(p)=Ixy(i-m1+k,j-m1+l); 
            H = 1/(m^2)*[sum(Ix2c),sum(Ixyc);sum(Ixyc),sum(Iy2c)];   
            r1 = abs(det(H)-kh*(trace(H))); 
            r(s)=r1;
            if r1>threshold
                R(i,j) = 1;
            else
                R(i,j)=0;
            end
            p=p+1;
            s=s+1;
            end
        end
    end
end
end


