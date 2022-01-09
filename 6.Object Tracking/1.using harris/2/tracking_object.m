clear all
close all
clc
v = VideoReader('visiontraffic.avi');
n = v.NumberOfFrames;
frameRGB_2 = read(v,1);
for i=140:n
frameRGB = read(v,i-1);
frameRGB_1 = read(v,i);
frameRGB_0=abs(frameRGB_1-frameRGB);
frameGray_1 = rgb2gray(frameRGB_0);
frameGray_1=gaussblur(frameGray_1);
J=edge_sobel(frameGray_1,130);
R=harris(J,20);
[RX, RY] = find(R == 1);
imshow(frameRGB_1);
hold on;plot(RY,RX,'ro')
end