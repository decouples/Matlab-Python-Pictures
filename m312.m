f=imread('09.jpg');
g_f=rgb2gray(f);
f2=logical(g_f);

[L,num]=bwlabel(f2,8); % L是一个填充，同一个区域用同一个值填充，num是连同分量个数，即块数。4连通法
g=bwperim(f2,8);%  g是边界元素，边界为1，非边界为0

B=bwboundaries(f2,8); %获取边界坐标，边界的连同性，4连通法
[b,l,nr,a]=bwboundaries(f2,8);

clc