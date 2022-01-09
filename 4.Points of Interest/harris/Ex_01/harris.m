function [R Cor Edg Fla]=harris(a)
[n m l]=size(a);
if l==3
    I=rgb2gray(a);
end
I=double(I);
%%% kernel de filtre gradient Ix,Iy
KGx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
KGy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
%%%%%% calcul de gradien Ix, Iy
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


%%%% calcul la somme de window w
m=5;
m1=ceil(m/2);
b1 = size(Ix);
kh = 0.04;
T = 10000;   %% threshold of R 
for i=m1:b1(1)-m1              %% i ou j les indice pour toutes les éléments de l'images                          
    for j=m1:b1(2)-m1                                   
        p=1;                                     
        for k=1:m              %% k ou l les indice pour toutes les éléments de window w                             
            for l=1:m                                   
            Ix2c(p)=Ix2(i-m1+k,j-m1+l);                   
            Iy2c(p)=Iy2(i-m1+k,j-m1+l); 
            Ixyc(p)=Ixy(i-m1+k,j-m1+l); 
            H = 1/(m^2)*[sum(Ix2c),sum(Ixyc);sum(Ixyc),sum(Iy2c)];   
            R(i,j) = det(H)-kh*(trace(H));                           
            if R(i,j)>T
                Cor(i,j) = 1;
            elseif R(i,j)<-T*0.5
                Edg(i,j) = 1;
            else
                Fla(i,j)=1;
            end
            p=p+1;
            end
        end
    end
end
end


