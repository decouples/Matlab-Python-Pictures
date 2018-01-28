# Matlab_pic

* 1、[VOC2007_image_rename.m](https://github.com/decouples/Matlab_pic/blob/master/VOC2007_image_rename.m： )将文件夹内的图片改为VOC图像的命名格式：000134.jpg。
* 2、[VOCmaker： ](https://github.com/whlook/VOCMaker)一个VOC标注制作工具
* 3、[label_2_mat.m： ](https://github.com/decouples/Matlab/blob/master/label_2_mat.m)制作深度学习的数据集标签，输入图片转化为mat格式
* 4、[picture_24_to_8_chanel.m： ](https://github.com/decouples/Matlab/blob/master/picture_24_to_8_chanel.m)将24位图像转化位8位图像
* 5、[cut-image.py: ]()计算一个文件夹内所有的RGB图片的均值，会算出3个均值对应于3个通道
* 6、[get-pixels-cv.py: ]()使用python进行像素级的操作，旋转、访问像素值、裁剪等操作
* 7、[liver_roi: ]() 已知roi区域的二值图与原图，需要得到roi区域的像素值。
* 8、[OpenRoi.m: ]() 原图，二值化、连通域提取、开操作，取得roi区域，重心、画框
----
* .mat的一个知识   
   如果要得到一个.mat文件，该文件内部包含多个值，如：mask、img等，可以采用将两个值分别载入matlab的工作空间，然后用：   
   save mydata mask img;   
   这样就将mask和img保存在了一个.mat文件内部，然后该文件的名字为：mydata.mat   
