%% 给图片上色
imgPath = 'D:\临时文件\zui\';        % 图像库路径
imgDir  = dir([imgPath '*.png']); % 遍历所有jpg格式文件
for i = 1:length(imgDir)          % 遍历结构体就可以一一处理图片了
    I = imread([imgPath imgDir(i).name]); %读取每张图片
    I_gray=rgb2gray(I);
    I_bw=uint8(im2bw(I_gray))*128;
    I1=uint8(zeros(size(I,1),size(I,2),3));
    I1(:,:,1)=I_bw;
    [x,map]=rgb2ind(I1,256);
    imgSaveName=imgDir(i).name(1:length(imgDir(i).name)-4);
    imwrite(x,map,strcat(imgSaveName,'.png'));
end
%%
% foldername = dir('liver_01_liver');% 用于得出所有子文件夹的名字
% for i=1:length(foldername)-2
%     filename=strcat('liver_01_liver\',foldername(i+2).name);% 读取子文件夹的名字和路径
%     % filename=dir('liver_01_liver');
%     imgname=dir(strcat(filename,'\*.jpg'));% 读取子文件夹图片，bmp格式
%     I=imread(imgname);% 读取图片
%     
%     %I=imread(imgname);
%     I_gray=rgb2gray(I);
%     I_bw=uint8(im2bw(I_gray))*128;
%     I1=uint8(zeros(size(I,1),size(I,2),3));
%     I1(:,:,1)=I_bw;
%     [x,map]=rgb2ind(I1,256);
%     imgSaveName=imgname(1:length(imgname)-4);
%     imwrite(x,map,strcat(imgSaveName,'.png'));
%     %save('存放路径\名字.mat',imagedata);
% end