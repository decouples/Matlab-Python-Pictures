% 简单的使用膨胀和腐蚀
% 例子9.2
% A = imread('Fig0906(a).tif');
% B = [0 1 0;1 1 1;0 1 0]; %结构元矩阵
% D = imdilate(A,B);
% figure,
% subplot(121);
% imshow(A)
% title('A')
% subplot(122);
% imshow(D);
% title('D');
%%
% 例子9.3
% A = imread('Fig0908(a).tif');
% se = strel('disk',10);
% E10 = imerode(A,se);
% figure,subplot(221)
% imshow(A)
% subplot(222);
% imshow(E10);
% 
% se2 = strel('disk',5);
% E5 = imerode(A,se);
% subplot(223);
% imshow(E5)
% 
% E20 = imerode(A,strel('disk',20));
% subplot(224);
% imshow(E20);

%%
% 例子9.5
% f = imread('Fig0913(a).tif');
% B1 = strel([0 0 0;0 1 1;0 1 0]);
% B2 = strel([1 1 1;1 0 0;1 0 0]);
% g = bwhitmiss(f,B1,B2);
% subplot(121);
% imshow(f)
% subplot(122)
% imshow(g);
%%
% 例子934
% f = imread('Fig0911(c).tif');
% ginf1 = bwmorph(f,'thin',1);
% ginf2 = bwmorph(f,'thin',2);
% ginf = bwmorph(f,'thin',Inf);
% subplot(231)
% imshow(ginf1);title('一次细化');
% subplot(232);
% imshow(ginf2);title('两次细化');
% subplot(233);
% imshow(ginf);title('一直到稳定的细化');
%
% f2 = imread('Fig0916(a).tif');
% fs = bwmorph(f2,'skel',Inf);
% subplot(234);
% imshow(f2);title('原始图片');
% for k =1:5
%     fs =fs&~endpoints(fs);
% end
% subplot(235);
% imshow(fs);title('使用bwmorph结果')
% fs2 = bwmorph(fs,'spur',5);
% figure,imshow(fs2);x
%%
% 例子9.7,找到每一个质心，并标记出来
% f = imread('Fig0917(a).tif');
% [L,n] = bwlabel(f);
% imshow(f);
% hold on;
% for k =1:n
%     [r,c] = find(L == k);
%     rbar = mean(r);
%     cbar = mean(c);
%     plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k',...
%         'MarkerFaceColor','k','MarkerSize',10);
%     plot(cbar,rbar,'Marker','*','MarkerEdgeColor','W');
% end

%%
% 例子 9.8 重建
% f = imread('Fig0922(a).tif');
% fe = imerode(f,ones(51,1));
% 
% fo = imopen(f,ones(51,1));
% fobr = imreconstruct(fe,f);
% g = imfill(f,'holes');
% g2 = imclearborder(f,4);
% 
% subplot(321)
% imshow(f);title('原图')
% subplot(322)
% imshow(fo);title('竖线开操作');
% subplot(323)
% imshow(fobr);title('竖线重建开操作')
% subplot(324)
% imshow(g);title('填充孔洞');
% subplot(325)
% imshow(g2);title('清除边界');
% figure,imshow(g2)
%%
% 例子9-6灰度级别的膨胀腐蚀

% f = imread('068.bmp');
% se = strel('square',3);
% gd = imdilate(f,se);
% ge = imerode(f,se);
% morph_grah = gd-ge;
% figure,imshow(f)
% figure,imshow(gd)
% figure,imshow(ge)
% figure,imshow(morph_grah)

%%
%例子9-9 开操作和闭操作作形态学平滑
% f = imread('Fig0925(a).tif');
% se = strel('disk',5);
% fo = imopen(f,se);
% foc = imclose(fo,se);
% 
% figure,imshow(f)
% fasf =f;
% for k =2:5
%     se = strel('disk',k);
%     fasf = imclose(imopen(fasf,se),se);
%     figure,imshow(fasf);
% end

%%
% 例子9-10，非均匀背景 的补偿
% f = imread('Fig0926(a).tif');
% se = strel('disk',10);
% fo = imopen(f,se);
% figure,imshow(fo);%开操作
% f2 = f-fo;
% f2 = imtophat(f2,se);
% figure,imshow(f2); %阈值处理后的效果
% 
% se = strel('disk',3);
% g = f+imtophat(f,se) - imbothat(f,se);
% figure,imshow(g);
%%
% 例子9-11 粒度的测定
% f = imread('Fig0925(a).tif');
% sumpixels = zeros(1,36);
% for k =0:35
%     se = strel('disk',k);
%     fo = imopen(f,se);
%     sumpixels(k+1) = sum(fo(:));
% end
% plot(0:35,sumpixels),xlabel('k'),ylabel('Surface area')
% figure
% plot(-diff(sumpixels));
% xlabel('k');
% ylabel('Surface area reduction')
% 
% %%
% se = strel('disk',5);
% f = imclose(f,se);
% sumpixels = zeros(1,36);
% for k =0:35
%     se = strel('disk',k);
%     fo = imopen(f,se);
%     sumpixels(k+1) = sum(fo(:));
% end
% figure
% plot(-diff(sumpixels));
% xlabel('k');
% ylabel('Surface area reduction')
%%
% 重建 9-6-3
% f = imread('Fig0925(a).tif');
% se = strel('disk',4);
% fe = imerode(f,se);
% fobr = imreconstruct(fe,f);
% 
% fobrc = imcomplement(fobr);
% fobrce = imerode(fobrc,se);
% fobrcbr = imcomplement(imreconstruct(fobrce,fobrc));
% 
% figure,imshow(f);
% figure,imshow(fobr);
% figure,imshow(fobrcbr)

%%
% % 例子9-12 移除复杂的背景
% f = imread('Fig0930(a).tif');
% figure,imshow(f);
% 
% f_obr = imreconstruct(imerode(f,ones(1,7)),f);
% f_o = imopen(f,ones(1,71));
% figure,imshow(f_o);
% 
% f_thr = f - f_obr;
% f_th = f- f_o;
% figure,imshow(f_th);
% 
% g_obr = imreconstruct(imerode(f_thr,ones(1,11)),f_thr);
% figure,imshow(g_obr);
% 
% g_obrd = imdilate(g_obr,ones(1,21));
% f2 = imreconstruct(min(g_obrd,f_thr),f_thr);
% figure,imshow(f2);
%%


