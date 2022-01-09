clear all
close all
clc
I=imread('img.png');
[n m l]=size(I);
if l==3
I=rgb2gray(I);
end
figure,imshow(I)
J1=zeros(n,m);
J2=zeros(n,m);
J3=zeros(n,m);
figure,imhist(I)
T=8;T1=4;T2=15;
for i=1:n
    for j=1:m
        if I(i,j)>80 && I(i,j)< 180
             J1(i,j)=T1;
        end
         if I(i,j)>50 && I(i,j)< 80
              J2(i,j)=T2;
         end
        if I(i,j)>80 && I(i,j)< 107
             J3(i,j)=T;
         end  
    end
end

J1 = label2rgb(J1);
J2 = label2rgb(J2);
J3 = label2rgb(J3);
figure(3),imshow(J1)
figure(4),imshow(J2)
figure(5),imshow(J3)
figure,
subplot(2,2,1),imshow(I)
subplot(2,2,2),imshow(J1)
subplot(2,2,3),imshow(J2)
subplot(2,2,4),imshow(J3)
