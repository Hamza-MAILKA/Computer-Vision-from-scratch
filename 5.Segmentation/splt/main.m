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
J=split256(I);
RGB_I = label2rgb(I);
figure(1),imshow(RGB_I),title('label2rgb appliqué a l image initiale');

RGB_J = label2rgb(J);
figure(2),imshow(RGB_J),title('label2rgb appliqué a l image de split');
