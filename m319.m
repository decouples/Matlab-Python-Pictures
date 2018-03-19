% 不使用imhist绘制直方图
% clear all;
% I = imread('1.jpg'); 
% I=rgb2gray(I);  %灰度化
% %绘制直方图 
% [m,n]=size(I); 
% GP=zeros(1,256);
% for k=0:255 
%      GP(k+1)=length(find(I==k))/(m*n);  %计算每级灰度出现的概率，将其存入GP
%  end 
%  
% %三，直方图均衡化 
% S1=zeros(1,256); 
% for i=1:256
%     for j=1:i 
%           S1(i)=GP(j)+S1(i);
%     end 
% end 
% S2=round((S1*256)+0.5); %将Sk归到相近级的灰度 
% for i=1:256 
%     GPeq(i)=sum(GP(find(S2==i)));%计算现有每个灰度级出现的概率 
% end 
% figure;
% subplot(221);bar(0:255,GP,'b');  
% title('原图像直方图') 
%  
% subplot(222);bar(0:255,GPeq,'b') 
% title('均衡化后的直方图') 
%  
% X=I;
% for i=0:255
%     X(find(I==i)) = S2(i+1);
% end
%  
% subplot(223);imshow(I);
% title('原图像') ;
% subplot(224);imshow(X);
% title('直方图均衡后的图像');

%%
% 例子2-4
% f = imread('Fig0615[original].tif');
% h = imhist(f)
% plot(h)
% axis([0 255 0 15000])
% set(gca,'xtick',[0 50 255]);
% set(gca,'ytick',[0:2000;15000])

% horz = linspace(0,255,25)
% bar(horz,h)
% axis([0 255 0 60000])
% set(gca,'xtick',0:50:255)
% set(gca,'ytick',0:20000:60000)
%%
% 直方图2-5
% f = imread('Fig0208(a).tif');
% figure,imshow(f);
% figure,imhist(f)
% ylim('auto')
% g = histeq(f,256);
% figure,imshow(g)
% figure,imhist(g)
% ylim('auto')
% hnorm = imhist(f)./numel(f);
% cdf = cumsum(hnorm);
% x = linspace(0,1,256);
% figure,plot(x,cdf)
% axis([0 1 0 1]);
% set(gca,'xtick',0:.2:1)
% set(gca,'ytick',0:.2:1)
% xlabel('Input intensity value','fontsize',9)
% ylabel('Output intensity value','fontsize',9)
%%
% 一个示例，用来试验roihist函数
% histroi计算图像中ROI的直方图。
%[P，NPIX] = histroi（F，C，R）计算图像F中感兴趣的多边形区域（ROI）的直方图P。
%多边形区域由其顶点的列和行坐标定义 在矢量C和R中分别指定（顺序地）。
%F的所有像素必须> = 0.参数NPIX是多边形区域中的像素数。
f = imread('068.bmp');
f = rgb2gray(f);     %如果是rgb图像的话
mask = roipoly(f);
[x1,x2] = find(mask);
[P,NPIX1] = histroi(f,x1,x2);
close all;
%%
mask2 = roipoly(f);
[x3,x4] = find(mask2);
mask3 = mask2 - mask;
[x5,x6] = find(mask3);
[P3,NIPIX3] = histroi(f,x5,x6);
close all;
%%
% a=imread('');
% [m,n]=size(a);
% c=ones(m,n)-a;
% imshow(c);
%%
%绘制图形
figure,plot(P)
hold on
plot(P3)
xlim([100 180]);
%%
%绘制出非目标区域的图
figure,imshow(f);
nn = im2bw(mask);figure,imshow(nn);title('目标区域');
mm = im2bw(mask3);figure,imshow(mm);title('非目标区域图')
%%







