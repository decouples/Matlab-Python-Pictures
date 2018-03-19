% T =[-2.7390 0.2929 -0.6373
%     0.7426 -0.7500 0.8088
%     2.8750 0.7500 1.000];
% tform = maketform('projective',T); %#ok<MTFP1>
% vistform(tform,pointgrid([0 0;1 1]));
%%
% f = imread('Fig0507(a).tif');
% T3 = [0.4788 0.0135 -0.0009
%     0.0135 0.4788 -0.0009
%     0.5059 0.5059 1.0000];
% tform3 = maketform('projective',T3);
% g3 = imtransform(f,tform3);
% figure,imshow(g3);
%%
% f = imread('Fig0508.tif');
% imshow(f,'Xdata',[-20 20],'Ydata',[-10 10]);
% axis on
% xlabel x;ylabel y;
% axis([8 8.5 0.8 1.1])
%%
% 例子 5-3
% f = imread('Fig0508.tif');
% figure,imshow(f);
% axis on;
% 
% theta = 3*pi/4;
% T = [cos(theta) sin(theta) 0
%     -sin(theta) cos(theta) 0
%     0 0 1];
% tform = maketform('affine',T);
% [g,xdata,ydata] = imtransform(f,tform,'FillValue',255);
% 
% hold on
% imshow(g,'XData',xdata,'YData',ydata);
% axis auto;
% axis on;
% %%
% T = [1 0 0;0 1 0;500 200 1];
% tform = maketform('affine',T);
% 
% g = imtransform(f,tform);
% imshow(g);
% axis on;
% [g, xdata, ydata] = imtransform(f,tform,'FillValue',255);
% imshow(f);
% hold on;
% imshow(g,'XData',xdata,'YData',ydata)
% axis on
% axis auto
%%
% f = imread('Fig0513(a).tif');
% imshow(f);
% 
% tform1 = maketform('affine',[1 0 0;0 1 0;300 500 1]);
% g1 = imtransform2(f,tform1,'FillValue',200);
% h1 = imtransform(f,tform1,'FillValue',200);
% imshow(g1),figure,imshow(h1);
% 
% tform2 = maketform('affine',[0.25 0 0;0 0.25 0;0 0 1]);
% g2 = imtransform2(f,tform2,'FillValues',200);
% h2 = imtransform(f,tform2,'FillValues',200);
%%
%例子5-5 内插方法示例
% f = imread('Fig0517(a).tif');
% timeit (@() reprotate(f,'nearest'))
% timeit (@() reprotate(f,'bilinear'))
% timeit (@() reprotate(f,'bicubic'))
% figure,imshow(reprotate(f,'nearest'))
% figure,imshow(reprotate(f,'bilinear'))
% figure,imshow(reprotate(f,'bicubic'))
%% 例子 5-6
% fref = imread('Fig0518(b).tif');
% f = imread('Fig0518(a).tif');
% s = load('cpselect-results');
% cpstruct = s.cpstruct;
% tform = cp2tform(cpstruct,'affine');
% visreg(fref,f,tform,axis([1740 2660 1710 2840]))
%% 例子 5-7
% f = imread('Fig0520(a).tif');
% w = imcrop(f,[100 320 9 9]);
% % imwrite(w,'520g.tif');
%  g = normxcorr2(w,f);
%  figure,imshow(abs(g));
%  
%  gabs = abs(g);
%  [ypeak,xpeak] = find(gabs == max(gabs(:)));
%  ypeak = ypeak - (size(w,1)-1)/2;
%  xpeak = xpeak - (size(w,2)-1)/2;
%  figure,imshow(f);
%  hold on;
%  plot(xpeak,ypeak,'wo')
 %%
 % 例子5-8 配准由于平移导致的两幅图像
%  f1 = imread('Fig0521(a).tif');
%  f2 = imread('Fig0521(b).tif');
%  w = imcrop(f1,[100 100 200 200]);
%  g1 = normxcorr2(w,f1);
%  g2 = normxcorr2(w,f2);
%  [y1,x1] = find(g1 == max(g1(:)));
%  [y2,x2] = find(g2 == max(g2(:)));
%  delta_x = x1- x2;
%  delta_y = y1 - y2;
%  tform = maketform('affine',[1 0 0;0 1 0;delta_x delta_y 1]);
%  visreg(f1,f2,tform);
%  figure,imshow(f1);
%  figure,imshow(f2);
%  figure,imshow(w);
 %%
 
 
 
 




