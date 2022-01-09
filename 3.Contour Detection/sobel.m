close all
clear all
clc
I = imread('peppers.png');
I=rgb2gray(I);
img=I;
I=double(I);
[n m]=size(I);
for i=1:n-1
    for j=1:m-1
          Gx=abs(I(i,j+1)-I(i,j));
          Gy=abs(I(i+1,j)-I(i,j));
          G=uint8(sqrt(Gx^2+Gy^2));
          if G>5
              I(i,j)=0;
          else I(i,j)=1;
          end
    end
end
S=double(I);
figure(1);imshow(img);title("original image")
figure(2);imshow(S);title("edge detection using gradient operator")
%%%%%%%%% edge detection using sobel,prewitt
S=edge(img,'sobel');
p=edge(img,'prewitt');
fspecial('sobel');
figure(3)
imshow(S)
title("edge detection using Sobel")
figure(4)
imshow(p)
title("edge detection using prewitt")

