clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% moyenneur
% I = imread('lena.jpg');
% I=rgb2gray(I);
% figure(1)
% imshow(I)
% title('image avant')
% J=moyenneur(I);
% figure(2)
% imshow(J)
% title('image aprés')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Gaussian bluring
% I = imread('lena.jpg');
% I=rgb2gray(I);
% J=gaussblur(I);
% figure(1)
% imshow([I J])

%%%%%%%%%%%%%%%%%%%%%%%%%% Median
% I = imread('peppers.png');
% I=rgb2gray(I);
% figure(1)
% imshow(I)
% title('image normal')
% D=I;
% I = imnoise(D, 'salt & pepper',0.5);
% figure(2)
% imshow(I)
% title('image avec le bruit ')
% J=median(I);
% figure(3)
% imshow(J)
%  title('image filtrés')


%%%%%%%%%%%%%%%%%%%%%%%% Transformation Lineare
% I = imread('pout.tif');
% [n m]=size(I);
% figure(1)
% imshow(I)
% title('image normal')
% J=LT(I);
% figure(2)
% imshow(J)
% title('image aprés')
% figure(3)
% subplot(2,1,1)
% imhist(I)
% title('histogram de l"image normal')
% subplot(2,1,2)
% imhist(J)
% title('histogram de l"image modifiée')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lissage
% I = imread('lena.jpg');
% I=rgb2gray(I);
% J=lissage(I);
% figure(1)
% imshow([I J])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GLCM
% I = imread('peppers.png');
% J=rgb2gray(I);
% figure(1)
% imshow(J)
% M=GLCM(J)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LBP                 
% I = imread('peppers.png');
% I=imread('lena.jpg');
% I=rgb2gray(I);
% D=I;
% J=lbp(I);
% imshow([I,J])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rotation 
% I = imread('lena.jpg');
% I=rgb2gray(I);
% figure(1)
% imshow(I)
% title('normal image')
% [VM HM RM]=Mirror(I);
% figure(2)
% imshow(VM)
% title('vertical rotation')
% 
% figure(3)
% imshow(HM)
% title('horizontal rotation')
% 
% figure(4)
% imshow(RM)
% title(' rotation pi/2')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% negative
% I=imread('lena.jpg');
% J=negative(I);
% figure(2)
% imshow([I,J])
%%%%%%%%%%%%%%%%%%%%%  
%%%%%%%%%%%%%%%%%%%%%  
% I = imread('lena.jpg');
% [C B]=cryptimg(I);
% figure(1)
% imshow(C)
% figure(2)
% imshow(B)
%%%%%%%%%%%%%%%%%%%% 
% I = imread('lena.jpg');
% I=rgb2gray(I);
% S=TGV(I);
% figure(1)
% imshow([I S])


