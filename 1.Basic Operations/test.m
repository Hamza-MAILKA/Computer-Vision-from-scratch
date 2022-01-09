close all
clear all
clc
I = imread('peppers.png');
figure(1)
imshow(I)
%%%%%%%%%%%%%%%%%%%  RGB2GRAY
I=RGB2GR(I);
figure(2)
imshow(I)
%%%%%%%%%%%%%%%% Histogram
h=histog(I);
figure(3)
subplot(2,1,1)
stem(h)
title('histogramme par utilisation de notre fonction')
subplot(2,1,2)
imhist(I)
title('histogramme par utilisation de la fonction imhist')
%%%%%%%%%%%%%%%%%%%%%%%%%% hotogramme version2
[hist_normal hist_v2]=histv2(I,5);
figure(4)
subplot(2,1,1)
stem(hist_normal)
title('histogramme entre 0 et 255')
subplot(2,1,2)
stem(hist_v2)
title('histogramme par utilisation de notre fonction avec n=5')
