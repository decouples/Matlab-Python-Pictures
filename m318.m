%例子11-13
% f = imread('Fig1128(a)[original].tif');
% fp = padarray(f,[84 84],'both');
% figure,imshow(fp);
% 
% %%imwrite(fp,'test.tif')
% 
% ftrans = zeros(568,568,'uint8');
% ftrans(151:550,151:550) = f; %将原图进行平移
% figure,imshow(ftrans)
% 
% fhs = f(1:2:end,1:2:end); %将原图缩小一半
% phsp = padarray(fhs,[184 184],'both');
% figure, imshow(phsp);
% 
% fm = fliplr(f); %镜像操作
% fmp = padarray(fm,[84 84],'both');
% figure,imshow(fm)
% 
% %g = imrotate(f,angle,method,'crop');
% fr45 = imrotate(f,45,'bilinear');
% fr90 = imrotate(f,90,'bilinear');
% fr90p = padarray(fr90,[84 84],'both');
% figure,imshow(fr45);
% figure,imshow(fr90);
% figure,imshow(fr90p);
% %%
% phi = invmoments(f);
% close all;
%%

%例子 11-14
% f1 = imread('Fig1130(a).tif');
% f2 = imread('Fig1130(b).tif');
% f3 = imread('Fig1130(c).tif');
% f4 = imread('Fig1130(d).tif');
% f5 = imread('Fig1130(e).tif');
% f6 = imread('Fig1130(f).tif');
% 
% S = cat(3,f1,f2,f3,f4,f5,f6);
% [X,R] = imstack2vectors(S);
% 
% P = principalcomps(X,6);
% 
% g1 = P.Y(:,1);
% g1 = reshape(g1,512,512);
% figure,imshow(g1,[])
% 
% g2 = P.Y(:,2);
% g2 = reshape(g2,512,512);
% figure,imshow(g2,[])
% 
% g3 = P.Y(:,3);
% g3 = reshape(g3,512,512);
% figure,imshow(g3,[])
% 
% g4 = P.Y(:,4);
% g4 = reshape(g4,512,512);
% figure,imshow(g4,[])
% 
% g5 = P.Y(:,5);
% g5 = reshape(g5,512,512);
% figure,imshow(g5,[])
% 
% g6 = P.Y(:,6);
% g6 = reshape(g6,512,512);
% figure,imshow(g6,[])
% d = diag(P.Cy);
% % close all;
%%
% 例子 11-15
f = im2bw(imread('Fig1134(a).tif'));
[x1 x2] = find(f);
X = [x1 x2];
p = principalcomps(X,2);
A = p.A;
Y = (A*(X'))';
miny1 = min(Y(:,1));
miny2 = min(Y(:,2));
y1 = round(Y(:,1)-miny1+min(x1));
y2 = round(Y(:,2)-miny2+min(x2));

idx = sub2ind(size(f),y1,y2);
fout = false(size(f));
fout(idx) = 1;
fout = imclose(fout,ones(3));
fout = (rot90(fout,2));
figure,imshow(f);
figure,imshow(fout);


