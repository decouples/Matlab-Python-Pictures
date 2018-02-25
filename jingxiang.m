
imgPath1 = 'D:/标记-CT/20180121周日旋转等操作/不含空标签的原始CT/';
save1 = 'D:/标记-CT/20180121周日旋转等操作/原始CT/水平镜像/';
save2 = 'D:/标记-CT/20180121周日旋转等操作/原始CT/垂直镜像/';
save3 = 'D:/标记-CT/20180121周日旋转等操作/原始CT/旋转图像/';
imgDir1 = dir([imgPath1 '*.bmp']);
for i = 1:length(imgDir1)
    A = imread([imgPath1 imgDir1(i).name]);
    [height,width,dim]=size(A);  
    tform=maketform('affine',[-1 0 0;0 1 0;width 0 1]);  
    B=imtransform(A,tform,'nearest');%B中存储的是经过水平镜像变换后的图像  
    tform2=maketform('affine',[1 0 0;0 -1 0;0 height 1]);  
    C=imtransform(A,tform2,'nearest');%C中存储的是经过竖直镜像变换后的图像 
    D = imrotate(A,90);              % D中保存的是图像的旋转结果
    imwrite(B,strcat(save1,num2str(i),'sp.bmp'));
    imwrite(C,strcat(save2,num2str(i),'cz.bmp'));
    imwrite(D,strcat(save3,num2str(i),'xz.bmp'));
end