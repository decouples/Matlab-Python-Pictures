# Matlab_pic

* 1、[VOC2007_image_rename.m](https://github.com/decouples/Matlab_pic/blob/master/VOC2007_image_rename.m： )将文件夹内的图片改为VOC图像的命名格式：000134.jpg。
* 2、[VOCmaker： ](https://github.com/whlook/VOCMaker)一个VOC标注制作工具
* 3、[label_2_mat.m： ](https://github.com/decouples/Matlab/blob/master/label_2_mat.m)制作深度学习的数据集标签，输入图片转化为mat格式
* 4、[picture_24_to_8_chanel.m： ](https://github.com/decouples/Matlab/blob/master/picture_24_to_8_chanel.m)将24位图像转化位8位图像
* 5、[cut-image.py: ]()计算一个文件夹内所有的RGB图片的均值，会算出3个均值对应于3个通道
* 6、[get-pixels-cv.py: ]()使用python进行像素级的操作，旋转、访问像素值、裁剪等操作
* 7、[liver_roi: ]() 已知roi区域的二值图与原图，需要得到roi区域的像素值。
* 8、[OpenRoi.m: ]() 原图，二值化、连通域提取、开操作，取得roi区域，重心、画框
* 9、[jingxiang.m ]()对图片进行镜像操作，并保存在指定文件夹内
* 10、[Double_angle.m]():求图片的角二阶矩
* 11、[my_11_23.m]() :处理文件夹内所有的图片，将每张图片都截取某一个区域，该区域分割为多个小块，并保存小块到指定文件夹
* 12、[mytestct.m]() : 输入一张图片，将固定区域截成若干个区域，然后计算每一个区域的均值、方差等特征，然后存入一个矩阵供后续处理。
* 13、[huidugongsheng.m](): 求解图片的灰度共生矩阵
* 14、[juxingfeature.m]() :输入图片-->二值化-->边缘统计-->标号-->由细度进行分类
* 15、[norgb2gray.m]() :不用rgb2gray函数进行将rgb转化为灰度图，用公式的方法：G=0.30*R+0.59*G+0.11*B
* 16、[m312.m]() :获取图片的边界坐标的一些操作
* 17、[m314_list.m](): 十行代码实现FCN标签制作
* 18、[m319.m]() : `Roi`区域的灰度直方图绘制、`u11.m`单一的绘制
* 19、[m22000.m](): 关于配准的一些代码，给出两幅图，进行匹配，连接等操作。
* 20、[m325.m、m0325.m](): 关于原图、mask、之间的一些操作
* 21、[m328_4.m ](): 图像复原的一些操作
----
* 22、[m329.m]() :一种加速matlab循环的方式，提前申请好内存，矢量化。减少图像处理中的运行时间
* 23、[m331_quyushengzhang_liver.m]() :采用区域生长方法进行肝部的分割，效果不太好，分割不完全，尤其对于肝部不是很均匀的图片
* 24、[m42.m](): 灰度变换操作
* 25、[m43_11.m](): 频域滤波处理
* 26、[m46_432.m](): 一些简单的操作，对于处理标签图像
----
* .mat的一个知识   
   如果要得到一个.mat文件，该文件内部包含多个值，如：mask、img等，可以采用将两个值分别载入matlab的工作空间，然后用：   
   save mydata mask img;   
   这样就将mask和img保存在了一个.mat文件内部，然后该文件的名字为：mydata.mat   
