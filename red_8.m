imgPath = '/home/lilin/pictures_labelme/zui/';        % 图像库路径
imgDir  = dir([imgPath '*.png']); % 遍历所有jpg格式文件
for i = 1:length(imgDir)          % 遍历结构体就可以一一处理图片了
    I = imread([imgPath imgDir(i).name]); %读取每张图片
    %I_gray=rgb2gray(I);
    I_gray = I;
    %I_bw=uint8(im2bw(I_gray))*128;
    I_bw=I;
    I1=uint8(zeros(size(I,1),size(I,2),3));
    I1(:,:,1)=I_bw;
    [x,map]=rgb2ind(I1,256);
    imgSaveName=imgDir(i).name(1:length(imgDir(i).name)-4);
    imwrite(x,map,strcat(imgSaveName,'.png'));
end