%频域滤波的一些知
%% 2018-04-03

I = imread('622.tif');
Id = im2double(I);
tf = fft2(Id);

ft_shift = fftshift(tf);
figure,subplot(121);imshow(abs(ft_shift),[]);title('Direct remap');

subplot(122);imshow(log(1+abs(ft_shift)),[]);title('Log remap');
%
[M,N] = size(I);
D = distmatrix(M,N);

D_shift = fftshift(D);
figure,mesh(D_shift);

%%
I = imread('622.tif');
Id = im2double(I);
I_dft = fft2(Id);
figure,imshow(Id);title('Original Image');
figure,imshow(log(1+abs(fftshift(I_dft))),[]);title('FT of original image');
% 生成距离矩阵
[M,N] = size(I);
dist = distmatrix(M,N);
figure,mesh(fftshift(dist)),title('Distance Matrix');

%%
H = zeros(M,N);
radius = 35;
ind = dist<=radius;
H(ind) = 1;
Hd = double(H);
%显示频率响应
figure,imshow(fftshift(H));title('Ideal low-pass filter');

DFT_filt = Hd .*I_dft;
I2 = real(ifft2(DFT_filt));
% 显示滤波的FT图像和最终的滤波图像
figure,imshow(log(1+abs(fftshift(DFT_filt))),[]);title('Filtered FT');
figure,imshow(I2);title('Filtered Image');
% 加载频域演示
fddemo;
%%
sigma = 30;
H_gau = exp(-(dist.^2)/(2*(sigma^2)));
figure,imshow(Id);title('Original Image');
figure,imshow(log(1+abs(fftshift(I_dft))),[]);title('DFT of original image');
figure,mesh(fftshift(dist));title('Distance Matrix');
figure,imshow(fftshift(H_gau));title('Gaussian low-pass');

DFT_filt_gau = H_gau.* I_dft;
I3 = real(ifft2(DFT_filt_gau));
figure,imshow(log(1+abs(fftshift(DFT_filt_gau))),[]);title('Filtered FT');
figure,imshow(I3);title('Filtered Image');


%巴特沃斯 LPF
D0 = 35;n =3;
H_but = 1./(1+(dist./D0).^(2*n));
figure,imshow(Id);title('Original Image');
figure,imshow(log(1+abs(fftshift(I_dft))),[]);title('FT of original image');
figure; mesh(fftshift(dist));title('Distance Matrix');
figure,imshow(fftshift(H_but));title('Butterworth low-pass');

% 对图像用巴特沃斯低�?滤波器得到的图像
DFT_filt_but = H_but.*I_dft;
I4 = real(ifft2(DFT_filt_but));
figure;imshow(log(1+abs(fftshift(DFT_filt_but))),[]);
figure,imshow(I4);title('Filtered Image');

figure,mesh(fftshift(Hd));title('Ideal low-pass filter');
figure,mesh(fftshift(H_gau));title('Gaussian low-pass filter');
figure,mesh(fftshift(H_but));title('Butterworth low-pass filter');
