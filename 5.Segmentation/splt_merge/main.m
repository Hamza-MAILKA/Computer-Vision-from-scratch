clear all
close all
clc
I=imread('img.png');
I=imresize(I,[256 256]);
[n m l]=size(I);
if l==3
    I=rgb2gray(I);
end
imshow(I)
Th=4;
J=split256(I,Th);
RGB = label2rgb(I);
figure(2),imshow(RGB),title('label2rgb appliqué a l image initiale');

RGB = label2rgb(J);
figure(3),imshow(RGB),title('label2rgb appliqué a l image de solit and merge');

