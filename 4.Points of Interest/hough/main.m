%% Load  image
clear all
close all
clc
img = imread('coins.png');
imshow(img)
img = img(:,:,1);
gaussianFilter = fspecial('gaussian',20, 10);
img_filted = imfilter(img, gaussianFilter,'symmetric');
filted_edges = edge(img_filted, 'Canny');
img_edges = edge(img, 'Canny');

%% Detection des droites 
[H, theta, rho] = hough_lines_acc(filted_edges); 
figure();
imshow(imadjust(mat2gray(H)),'XData',theta,'YData',rho,'InitialMagnification','fit');
title('Hough transform');
xlabel('\theta'), ylabel('\rho');axis on, axis normal, hold on;
colormap(hot);
peaks = hough_peaks(H); 
imshow(imadjust(mat2gray(H)),'XData',theta,'YData',rho,'InitialMagnification','fit');
title('Hough transform with peaks found');
xlabel('\theta'), ylabel('\rho');axis on, axis normal, hold on;
plot(theta(peaks(:,2)),rho(peaks(:,1)),'o','LineWidth',3,'color','red');
% % %% Draw Lines
hough_lines_draw(img, peaks,rho,theta);
% % 
%% Detection des cercles
% radius=20;
% H = hough_circles_acc(filted_edges, radius);
% figure();
% imshow(imadjust(mat2gray(H)));
% centers = hough_peaks(H);
% hough_circles_draw(img, centers,radius);