clear all
close all
clc
I=imread('plant.jpg');
J=I;
imshow(J)
figure,imshow(J)
threshold=27;
I=gaussblur(I);
B=edge_sobel(I,140);
figure,imshow(B),title('detection de contour');
[R r]=harris(B,threshold);%%% r : c'est pour choisir la seuil 
figure,imshow(R), title('points d’intérêts');
[RX, RY] = find(R == 1);
figure,imshow(J), title('Image obtenue');
hold on;plot(RY,RX,'ro')