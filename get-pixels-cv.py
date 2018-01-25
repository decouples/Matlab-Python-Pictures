# -*- coding: utf-8 -*-
"""
Created on Wed Jan 24 20:00:35 2018

@author: April
"""
# 导入pillow
from PIL import Image
 
# 加载原始图片
img = Image.open("00010.bmp")
 
# -------------------------------从左上角开始 剪切 200*200的图片
img2 = img.crop((0, 0, 200, 200))
img2.save("lena.jpg")

# ---------------------------------逆时针旋转方向,顺时针那么就输入-45，
img2 = img.rotate(45)
img2.save("rota.jpg")
img33 = img.rotate(90)
img33.save("rotate2.jpg")

# ------------------------------------不变化大小的旋转，重采样
img4 = img.rotate(45, resample = Image.NEAREST)# 近邻采样（默认）
img4.save("rotate-no.jpg")

img5 = img.rotate(45,resample=Image.BILINEAR) #线性插值
img5.save("img5.jpg")

img8 = img.rotate(45, resample=Image.BICUBIC)# 三次样条插值
img8.save("rubberwhale8.jpg")
# --------------------------------不同的位置开始，右下角开始
width = img.size[0]  # 图片大小
height = img.size[1]
img3 = img.crop(
    (
        width - 200,
        height - 200,
        width,
        height
    )
)
img3.save("lena3.jpg")

# -------------------------------------------中间开始切割
half_the_width = img.size[0] / 2
half_the_height = img.size[1] / 2
img4 = img.crop(
    (
        half_the_width - 50,
        half_the_height - 75,
        half_the_width + 50,
        half_the_height + 75
    )
)
img4.save("lena4.jpg")

# -------------------------------------------填充为正方形
longer_side = max(img4.size)
horizontal_padding = (longer_side - img4.size[0]) / 2
vertical_padding = (longer_side - img4.size[1]) / 2
img5 = img4.crop(
    (
        -horizontal_padding,
        -vertical_padding,
        img4.size[0] + horizontal_padding,
        img4.size[1] + vertical_padding
    )
)
img5.save("lena5.jpg")
