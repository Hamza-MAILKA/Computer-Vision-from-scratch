clear all
close all
clc
v = VideoReader('visiontraffic.avi');
n = v.NumberOfFrames;
ws = 15;
frameRGB_2 = read(v,1);
for i=100:n
frameRGB = read(v,i-1);
frameRGB_1 = read(v,i);
im1=rgb2gray(frameRGB);
im2=rgb2gray(frameRGB_1);
Im1 = im2double(im1);
Im2 = im2double(im2);
[U, V, C] = lk(Im1, Im2, ws);
imshow(Im1); hold on;
quiver(C(:,1), C(:,2), -U, -V, 1, 'b'); hold off;
end
