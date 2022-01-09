clear all
close all
clc

im = imread('1.png');
%%% conversion de l'image en tableaux
tab = reshape(im,[size(im,1)*size(im,2) 3]);

%  nombres de cluster
clusterNo =10;

% le nombre maximum d'itérations
maxIter = 500;

[cmap,V] = k_means(tab, clusterNo, maxIter);
c_map2 = reshape(cmap, [size(im,1) size(im,2)]);
M = V / 255;
clusteredImage = label2rgb(c_map2,M);

figure
subplot(1,2,1),imshow(clusteredImage)
subplot(1,2,2),imshow(im)