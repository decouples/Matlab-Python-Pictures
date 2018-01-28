% 实现肝脏区域的提取,已知的是roi区域的二值图，和原图，要得到roi区域的像素值。
I = imread('img.png');
L = imread('label.png');
I2 = rgb2gray(I);
G=zeros(512,512);
G(:,:,1)=L;
M = uint8(G).*(I2);
H(:,:,1)=M;H(:,:,2)=M;H(:,:,3)=M;
imshow(H)
