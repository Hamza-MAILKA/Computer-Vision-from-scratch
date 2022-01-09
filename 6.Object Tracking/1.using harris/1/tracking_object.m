clear all
close all
clc
v = VideoReader('visiontraffic.avi');
n = v.NumberOfFrames;
frameRGB_ref = read(v,1);
for i=100:n
frameRGB_1 = read(v,i-1);
frameRGB_2 = read(v,i);
%%% image contient seulement les objets en mouvement 
object=abs(frameRGB_2-frameRGB_1);
%%% image contient seulement les objets en mouvement  plus 
%%% la partie strucurelle de la route 
img_object=object+frameRGB_ref;

%%% conversion en gray
img_object_gray = rgb2gray(img_object);
object_gray = rgb2gray(object);
%%% detection contour
img_object_edge=edge_sobel(img_object_gray,130);
object_edge=edge_sobel(object_gray,130);

corners = detectHarrisFeatures(object_edge);
[features_1, valid_corners_1] = extractFeatures(object_edge, corners);
imshow(img_object_edge); hold on
plot(valid_corners_1);
end


