clear all
close all
clc
img = imread('lena.jpg');
img = rgb2gray(img);
img = double (img);
[n,m]=size(img);
Laplace_kernel = [1, 2, 1; 2, -12, 2; 1, 2, 1];
for u = 2:n-2
         for v = 2:m-2
              sum1 = 0;            
              for i=-1:1
                for j=-1:1                   
                    sum1 = sum1 + img(u + i, v + j)* Laplace_kernel(i + 2,j + 2);
                end
            end
            lp(u,v) = sum1;
         end
end
lp=uint8(lp);
figure(1)
imshow(lp)


