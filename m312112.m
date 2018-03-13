% 例11.2
f = imread('Fig1103(a).tif');
% f = imread('77.bmp');
% f = rgb2gray(f);
h = fspecial('average',9);
g = imfilter(f,h,'replicate');
gB = im2bw(g,0.55);

figure,imshow(f);title('原始图片');
figure,imshow(g);title('9x9平滑后的图像');
figure,imshow(gB);title('阈值处理过后的图片');
%获取gB外边界
B = bwboundaries(gB,'noholes');
%我们只对最长的边界有关
d = cellfun('length',B);
[maxd,k] = max(d);
b = B{k};

[M N] = size(g);
g = bound2im(b,M,N);
figure,imshow(g);title('二值图像的边界');
%%
[s,su] = bsubsamp(b,50);
g2 = bound2im(s,M,N);
figure,imshow(g2);title('子取样边界');
%%
cn = connectpoly(s(:,1),s(:,2));
g3 = bound2im(cn,M,N);
figure,imshow(g3);title('连接的子采样');
%%
c = fchcode(su);
clear
clc