% 一些简单的灰度变换操作
x = uint8(0:255);
plot(x);xlim([0 255]);ylim([0 255]);

I = imread('622.tif');
I_adj = x(I+1);
figure,subplot(121);imshow(I);title('Original Image');
subplot(122);imshow(I_adj),title('Adjusted Image');
%%
%取反操作
y = uint8(255:-1:0);I_neg = y(I+1);
figure,subplot(131);plot(y),title('Transformation Function'),xlim([0 255]);ylim([0 255]);
subplot(132);imshow(I),title('Original Image');
subplot(133);imshow(I_neg),title('Negative Image');
%%
%求补
I_cmp = imcomplement(I);
I_dif = imabsdiff(I_cmp,I_neg);
figure,imshow(I_cmp)
figure,imshow(I_dif,[])
%%
% 对数变换
x = 0:255;c=255/log(256);
y = c*log(x+1);
figure,subplot(221),plot(y);title('Log Mapping Function'),axis tight,axis square;

I_log = uint8(y(I+1));
subplot(222);imshow(I),title('Original Image');
subplot(223);imshow(I_log),title('Adjusted Image');

I_br = imadd(I,100);
subplot(224);imshow(I_br);title('Original Image Scaled');
%%
% 反对数变换回原来的变换
z = exp(x/c) - 1;
I_invlog = uint8(z(I_log+1));
figure,subplot(211);plot(z);title('Inverse-log Mapping Function');
subplot(212);imshow(I_invlog),title('Adjusted Image');

clear;clc;close all;
%%
% 
x = 0:255;n=2;c=255/(255^n);
root = nthroot((x/c),n);
figure,subplot(221);plot(root);title('2nd-root transformation');axis tight;axis square;
%%
I = imread('622.tif');
I_root = uint8(root(I+1));
subplot(222);imshow(I);title('Original Image');
subplot(2,2,[3 4]);imshow(I_root);title('Nth Root Image');
%%
% 一个n次方变换函数
power = c*(x.^n);
figure,subplot(121),plot(power),title('2nd-power transformation');
axis tight;axis square;
%%
% 变回原来的
I_power = uint8(power(I_root+1));
subplot(122);imshow(I_power);title('Adajusted Image');
%%
clc;clear all;close all;
%%

I = imread('622.tif');
figure,subplot(131);imshow(I);title('Original Image');
y(1:175) = 0:174;
y(176:200) = 255;
y(201:256) = 200:255;
subplot(132);plot(y);axis tight,axis square;
%%
I2 = uint8(y(I+1));
subplot(133);imshow(I2);title('Adjusted Image');
%%
z(1:175) = 50;
z(176:200) =250;
z(201:256) = 50;
I3 = uint8(z(I+1));
figure,subplot(121);plot(z);xlim([0 255]);ylim([0 255]);axis square;
subplot(122);imshow(I3);
%%





