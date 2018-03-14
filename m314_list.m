% 二分类标签mask制作办法
% 2018-03-14
%%
% 使用说明：
% 首先建立对应的图片文件夹和存放标签的文件夹，然后运行，鼠标左键开始绘制轮廓，
% 点击右键结束，结束后，在绘制区域右键“create mask"然后，标签就保存在了对应的文件夹内，就自动进行下一张标注了
% 注意：这无法修改，边界只能一次成功，如果或该次没有成功绘制边界，下一次就是下一张图片了。
% 标签可以是logical类型，注释掉"mask=uint8(mask)"就好了;，也可以是uint8类型（0-1全黑label）
imgPath = 'J:/临时文件/肝部数据/汇总820张/';        % 图像库路径
imgPath2 = 'J:/临时文件/肝部数据/汇总标签/';        %存放标签的路径；
imgDir  = dir([imgPath '*.png']); % 遍历所有jpg格式文件
for i = 1:length(imgDir)          % 遍历结构体就可以一一处理图片了
    I = imread([imgPath imgDir(i).name]); %读取每张图片
    mask = roipoly(I);  %创建mask
    mask=uint8(mask);   %强制类型转换
    imwrite(mask,strcat(imgPath2,imgDir(i).name)); %处理后的图片保存在imgPath2目录下
    close all; %关闭当前窗口，进行下一轮标注
end
%%

