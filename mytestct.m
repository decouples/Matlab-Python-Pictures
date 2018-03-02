% 输入一个图片，然后分块切割，计算切割部分的均值方差等特征值，然后将其存在一个数组当中，进行后续处理

%%
pi = imread('03.jpg');
I1 = rgb2gray(pi);
I = double(I1);
M=zeros(101,3);
h=1;
k = 1;
for i=1:10:91
    for j=1:10:91
        G = imcrop(I,[i j 9 9]);
        %截取10x10大小的区域进行计算
        c1 = mean2(G);
        c2 = var(G(:));
        M(k,h) = c1;
        M(k,h+1)=c2;
        h=1;
        k=k+1;
    end
end
%%
% 一个遍历每一个数字进行计算的方法，简单的模拟进行计算的过程
for f=1:100
    M(f,3) = M(f,1)+M(f,2);
end
M

        