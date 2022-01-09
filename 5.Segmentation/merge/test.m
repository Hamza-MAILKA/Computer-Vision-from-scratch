clear all
close all
clc
I=imread('img.png');
I=imresize(I,[256 256]);
[n m l]=size(I);
if l==3
    I=rgb2gray(I);
end
B=merge(I,4);
RGB = label2rgb(B);
figure(1),imshow(uint8(B))
figure(2),imshow(RGB),title('label2rgb appliqué a l image de fusion');
figure(3),imshow(label2rgb(I)),title('label2rgb appliqué a l image initiale');
