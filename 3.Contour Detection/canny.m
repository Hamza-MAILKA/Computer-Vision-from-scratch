clear all
close all
clc
I = (imread('lena.jpg'));
% I=rgb2gray(I);
% img=I;
I= double(rgb2gray(I));
KGx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
KGy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
[n m]=size(I);
T_Low = 0.075;
T_High = 0.175;
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
figure(1), imshow(uint8(magnitude2))
%{
arah = atan2 (Filtered_Y, Filtered_X);
arah = arah*180/pi;
figure(2),imshowpair(uint8(magnitude2), arah, 'montage');
[Gmag, Gdir] = imgradient(I,'sobel');
figure(3),imshowpair(Gmag, Gdir, 'montage');

B=magnitude2;
for i=1:n-2
    for j=1:m-2
      if B(i,j)>100
            B(i,j)=1;
      else B(i,j)=0;
      end
    end
end
figure,imshow(~B);title('Binarisation de l_image');

pan=n-2;
leb=m-2;
for i=1:pan
    for j=1:leb        
        if (arah(i,j)<0) 
            arah(i,j)=360+arah(i,j);
        end
    end
end

arah2=zeros(pan, leb);

%Réglage des directions à 0, 45, 90 ou 135 degrés
for i = 1  : pan
    for j = 1 : leb
        if ((arah(i, j) >= 0 ) && (arah(i, j) < 22.5) || (arah(i, j) >= 157.5) && (arah(i, j) < 202.5) || (arah(i, j) >= 337.5) && (arah(i, j) <= 360))
            arah2(i, j) = 0;
        elseif ((arah(i, j) >= 22.5) && (arah(i, j) < 67.5) || (arah(i, j) >= 202.5) && (arah(i, j) < 247.5))
            arah2(i, j) = 45;
        elseif ((arah(i, j) >= 67.5 && arah(i, j) < 112.5) || (arah(i, j) >= 247.5 && arah(i, j) < 292.5))
            arah2(i, j) = 90;
        elseif ((arah(i, j) >= 112.5 && arah(i, j) < 157.5) || (arah(i, j) >= 292.5 && arah(i, j) < 337.5))
            arah2(i, j) = 135;
        end
    end
end
BW = zeros (pan, leb);
%Suppression  des non maxima
for i=2:pan-1
    for j=2:leb-1
        if (arah2(i,j)==0)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i,j+1), magnitude2(i,j-1)]));
        elseif (arah2(i,j)==45)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j-1), magnitude2(i-1,j+1)]));
        elseif (arah2(i,j)==90)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j), magnitude2(i-1,j)]));
        elseif (arah2(i,j)==135)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j+1), magnitude2(i-1,j-1)]));
        end
    end
end
BW;
size(BW)
BW = BW.*magnitude2;
size(BW)
figure, imshow(BW);
% Seuillage d'hystérésis
T_Low = T_Low * max(max(BW));
T_High = T_High * max(max(BW));
T_res = zeros (pan, leb);
for i = 2  : pan
    for j = 2 : leb
        if (BW(i, j) < T_Low)
            T_res(i, j) = 0;
        elseif (BW(i, j) > T_High)
            T_res(i, j) = 1;
        %Utilisation de 8 composants connectés
        elseif ( BW(i+1,j)>T_High || BW(i-1,j)>T_High || BW(i,j+1)>T_High || BW(i,j-1)>T_High || BW(i-1, j-1)>T_High || BW(i-1, j+1)>T_High || BW(i+1, j+1)>T_High || BW(i+1, j-1)>T_High)
            T_res(i,j) = 1;
        end
    end
end

edge_final = uint8(T_res.*255);
%Afficher le résultat final de la détection de bord
figure, imshow(edge_final), title('Edge Lena');
figure,imshow(arah2)
%}
