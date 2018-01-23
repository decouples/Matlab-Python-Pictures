root='D:\数据集\3Dircadb\新建文件夹\';
input_dir=strcat(root,'original_CT256\');
output_dir=strcat(root,'original_CT256_2_8bit\');
files = dir([input_dir, '*.jpg']);
n = length(files);

for i = 1:n 
    [filename, type] = strtok(files(i).name, '.');
    im_src = imread([input_dir, files(i).name]);
    info=imfinfo([input_dir, files(i).name]);
    if info.BitDepth==8  %转化为24位rgb
        im_src=cat(3,im_src,im_src,im_src);
    end
   [x,map]=rgb2ind(im_src,2);
    newname=strcat(output_dir,filename,'.png');
    imwrite(x,map,newname,'png');

end