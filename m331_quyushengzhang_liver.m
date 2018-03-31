clc;clear all;close all;
I = imread(fullfile(pwd,'./image/90.bmp'));
X = imadjust(I,[0.2 0.8],[0 1]);
%%阈值分割
bw =im2bw(X,graythresh(X));
[r,c] = find(bw);
rect = [min(c) min(r) max(c)-min(c) max(r)-min(r)];
Xt = imcrop(X,rect);
%自动获取种子点
seed_point = round([size(Xt,2)*0.15+rect(2) size(Xt,1)*0.4+rect(1)]);
%区域生长分割
X = im2double(im2uint8(mat2gray(X)));
X(1:rect(2),:) =0;
X(:,1:rect(1)) = 0;
X(rect(2)+rect(4):end,:)=0;
X(:,rect(1)+rect(3):end)=0;
[J,seed_point,ts]=Regiongrowing(X,seed_point);
figure(1);
subplot(1,2,1);imshow(I,[]);
hold on;
plot(seed_point(1),seed_point(2),'ro','MarkerSize',10,'MarkerFaceColor','r');
title('自动选择种子点');
hold off;
subplot(1,2,2);imshow(J,[]);title('区域生长影像');
%形态学后处理
bw = imfill(J,'holes');
bw = imopen(bw,strel('disk',5));
%提取边缘
ed = bwboundaries(bw);
figure;
subplot(1,2,1);imshow(bw,[]);title('形态学后处理影像');
subplot(1,2,2);imshow(I);
hold on;
for k =1:length(ed)
    %边缘
    boundary=ed{k};
    plot(boundary(:,2),boundary(:,1),'g','LineWidth',2);
end
hold off;
title('边缘标记影像');
%%
function [J,seed_point,ts] = Regiongrowing(I,seed_point)
%统计耗时
t1 = cputime;
%参数检测
if nargin <2
    %显示选择种子点
    figure;imshow(I,[]);hold on;
    seed_point = ginput(1);
    plot(seed_point(1),seed_point(2),'ro','MarkerSize',10,'MarkerFaceColor','r');
    title('种子点选择');
    hold off;
end
%变量初始化
seed_point = round(seed_point);
x = seed_point(2);
y = seed_point(1);
I = double(I);
rc = size(I);
J = zeros(rc(1),rc(2));
%参数初始化
seed_pixel = I(x,y);
seed_count = 1;
pixel_free = rc(1)*rc(2);
pixel_index = 0;
pixel_list = zeros(pixel_free,3);
pixel_similarity_min=0;
pixel_similarity_limit = 0.1;
%领域
neighbor_index =[-1 0;
    1 0;
    0 -1;
    0 1];
%循环处理
while pixel_similarity_min<pixel_similarity_limit && seed_count<rc(1)*rc(2)
    %增加相邻位置
    for k = 1:size(neighbor_index,1)
        %计算相邻位置
        xk = x+neighbor_index(k,1);
        yk = y+neighbor_index(k,2);
        %区域生长
        if xk>=1 && yk>=1 && xk<=rc(1) && yk<=rc(2) && J(xk,yk) ==0
            %满足条件
            pixel_index = pixel_index+1;
            pixel_list(pixel_index,:) = [xk yk I(xk,yk)];
            %更新状态
            J(xk,yk) = 1;
        end
    end
    %更新空间
    if pixel_index+10 > pixel_free
        pixel_free = pixel_free+pixel_free;
        pixel_list(pixel_index+1:pixel_free,:) = 0;
    end
    %统计迭代
    pixel_similarity = abs(pixel_list(1:pixel_index,3) - seed_pixel);
    [pixel_similarity_min,index] = min(pixel_similarity);
    %更新状态
    J(x,y) = 1;
    seed_count = seed_count+1;
    seed_pixel = (seed_pixel*seed_count + pixel_list(index,3))/(seed_count+1);
    %存储位置
    x = pixel_list(index,1);
    y = pixel_list(index,2);
    pixel_list(index,:) = pixel_list(pixel_index,:);
    pixel_index = pixel_index-1;
end
%返回结果
J =mat2gray(J);
J =im2bw(J,graythresh(J));
%统计耗时
t2 = cputime;
ts = t2-t1;




