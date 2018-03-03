% 2018-03-03
% 读取图片并且二值化他们
img = imread('0000.bmp');
figure,imshow(img);
img = im2bw(img);%（图像分割）转化为二值图
img = not(img);%把图像想表达的内容变成1
figure,imshow(img);


% 使用bwboundaries函数显示目标的边界
[B,L] = bwboundaries(img);
figure,imshow(img);
hold on;
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2),boundary(:,1),'g','LineWidth',2);
end

%使用bwlabel标记测试图像中的连续区域，伪彩色化他们，然后结合他们的标号显示他们
[L,N] = bwlabel(img);
img_rgb = label2rgb(L,'hsv',[.5 .5 .5],'shuffle');
figure,imshow(img_rgb);hold on
for k =1:length(B)
    boundary = B{k};
    plot(boundary(:,2),boundary(:,1),'w','LineWidth',2);
    text(boundary(1,2)-11,boundary(1,1)+11,num2str(k),'Color','y','Fontsize',14,'FontWeight','bold');
end

%利用函数regionprops函数对图像中的每个目标提取下面的而至特征
% Area（面积）,Centroid（重心）,Eccentricity（偏心率）,Perimeter（周长）
stats = regionprops(L,'all');%统计的数保留在stats内
temp = zeros(1,N);
for k = 1:N
    %计算thinness ratio（细度比例）
    temp(k) = 4 * pi * stats(k,1).Area / (stats(k,1).Perimeter)^2;
    stats(k,1).ThinnessRatio = temp(k);
    %计算aspect ratio
    temp(k) = (stats(k,1).BoundingBox(3))/(stats(k,1).BoundingBox(4));
    stats(k,1).AspectRatio = temp(k);
end

% 以面积与细度比例为例，画出其矢量图，制作分类器
areas = zeros(1,N);
for k = 1:N
    areas(k) = stats(k).Area;
end
TR = zeros(1,N);

for k = 1: N
    TR(k) = stats(k).ThinnessRatio;
end
cmap = colormap(lines(21));
figure
for k = 1:N
    scatter(areas(k),TR(k),[],cmap(k,:),'filled');
    ylabel('Thinness Ratio'),xlabel('Area');
    hold on
end

