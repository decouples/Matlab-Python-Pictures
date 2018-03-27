f1 = imread('0000.bmp');
f=rgb2gray(f1);
f=tofloat(f);

[gsobel_default,ts]=edge(f,'sobel');
[glog_default,tlog]=edge(f,'log');
[gcanny_default,tc]=edge(f,'canny');

gsobel_best=edge(f,'sobel',0.1);
glog_best=edge(f,'log',0.008,2.25);
gcanny_best=edge(f,'canny',[0.08 0.2]);

figure
imshow(gsobel_default)
figure
imshow(glog_default)
figure
imshow(gcanny_default)

figure
imshow(gsobel_best)
figure
imshow(glog_best)
figure
imshow(gcanny_best)
