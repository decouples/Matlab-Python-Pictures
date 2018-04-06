% 以下代码实现肝部与mask之间的一些常见操作，每一个代码块儿是独立的，不需要的可以注释掉
% 注意路径和文件的后缀
% 2018-04-06 @lilin
tic;
imgPath = 'E:\肝部数据\第二次Matlab做肝部_432张\001\';%原始图片位置
imgDir  = dir([imgPath '*.bmp']);                   %遍历所有png格式文件
imgPath2 = 'E:\肝部数据\第二次Matlab做肝部_432张\002\';%原始标签位置
imgDir2  = dir([imgPath2 '*.png']);                   %遍历所有png格式文件
% 保存路径
imgPath3 = 'E:\肝部数据\第二次Matlab做肝部_432张\003\';%处理过的图片保存位置1
imgPath4 = 'E:\肝部数据\第二次Matlab做肝部_432张\004\';%处理过的图片保存位置2
imgPath5 = 'E:\肝部数据\第二次Matlab做肝部_432张\005\';%处理过的图片保存位置3
imgPath6 = 'E:\肝部数据\第二次Matlab做肝部_432张\006\';%处理过的图片保存位置4

for i = 1:length(imgDir)
    I = imread([imgPath imgDir(i).name]);
    J = imread([imgPath2 imgDir2(i).name]);
    [m,n,~] = size(I);
    % 本段代码实现去掉CT四周的个人信息----------------1
    I1 = zeros(m,n);
    for m1 = 1:m
        for n1 = 1:n
            if I(m1,n1,1)~=I(m1,n1,2)||I(m1,n1,1)~=I(m1,n1,3)||I(m1,n1,2)~=I(m1,n1,3)
                I1(m1,n1) =I1(m1,n1); 
            else
                I1(m1,n1) = I(m1,n1);
            end
        end
    end
    I1 = uint8(cat(3,I1,I1,I1));
    new_name1 = imgDir(i).name(1:end-4);
    new_name_1 = strcat(new_name1,'.png');
    imwrite(I1,strcat(imgPath3,new_name_1));%以原来的CT名字保存图片，到路径：imgPath3
    %%
    % 本段代码实现将肝部从原始图片提取出来--------------2
    I2 = zeros(m,n);
    for m3 = 1:m
        for n3 = 1:n
            if J(m3,n3) == 0
                I2(m3,n3) = I2(m3,n3);
            else
                I2(m3,n3) = I(m3,n3);
            end
        end
    end
    I2 = uint8(cat(3,I2,I2,I2));
    new_name2 = imgDir(i).name(1:end-4);
    new_name_2 = strcat(new_name2,'.png');
    imwrite(I2,strcat(imgPath4,new_name_2));%以和标签一样的名字保存图片，到路径：imgPath4
    %%
    % 本段代码实现图片的旋转--------------------------3
    % 注意这里涉及到了原始图片的操作，注意和标签一一对应；
    % 本旋转是不改变大小的旋转，裁剪多余的
    % 如果将本旋转基于去除个人信息的CT，将下列的 I 改为 I1
    I3 = imrotate(I,45,'bilinear','crop'); %逆时针旋转45°
    J3 = imrotate(J,45,'bilinear','crop');  %逆时针旋转45°
    new_name31 = imgDir(i).name(1:end-4);
    new_name_31 = strcat(new_name31,'.png');
    imwrite(I3,strcat(imgPath5,new_name_31));
    imwrite(J3,strcat(imgPath6,new_name_31));
    %%
    %本段代码实现扭曲操作-----------------------------4
    
end
clc;clear;close all;
toc

