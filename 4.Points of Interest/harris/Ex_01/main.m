clear all
close all 
clc

a = imread('board.png');
[R Cor Edg Fla]=harris(a);
figure(1),imshow(a);
title('Image Original')
figure(2),imagesc(R);
title('Image coeff R')
figure(3),imshow(Cor);
title('detection de coins')
figure(4),imshow(Edg);
title('detection de contour')
figure(5),imshow(Fla);
title('detection des régions plates')