I = imread('img.png');
whos
% 显示原图像，并进行显示
figure('name','myapp');
subplot(2,2,1),imshow(I),title('I');

% 二值化图像并进行显示
level=graythresh(I);
bw=im2bw(I,level);
subplot(2,2,2),imshow(bw),title('bw');

%开操作去除噪点
se = strel('disk',2);
openbw=imopen(bw,se);
subplot(2,2,3),imshow(openbw),title('open')

%获取连通域
L=bwlabel(openbw,4);
RGB = label2rgb(L);
subplot(2,2,4),imshow(RGB),title('rgb');

%获取区域的basic属性
stats = regionprops(openbw,'basic');
centroids = cat(1,stats.Centroid);
figure('name','regionprops');
imshow(openbw),title('centroids')
hold on
plot(centroids(:,1),centroids(:,2),'b*');
for i = 1:size(stats)
    rectangle('Position',[stats(i).BoundingBox],'LineWidth',2,'LineStyle','--','EdgeColor','r')
end
hold off
