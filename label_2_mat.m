clc   
clear   
% im=imread('C:\Users\Administrator\Desktop\1.png');   
dirction='D:\数据集\3Dircadb\新建文件夹\liver256_2_8bit';   
Path=dir(fullfile(dirction,'*.png'));   
for k=1:numel(Path)   
    imPath=fullfile(dirction,Path(k).name);   
    im=imread(imPath);     
    [row col]=size(im);                        %图片的尺寸   
    bd=cell(1,33);   
    bd(:)={logical(sparse(row,col))};  %在一个元胞数组中预载33个全零稀疏矩阵，背景0不算   
    N=unique(im);                              %图片分成多少类   
    if N(1)==0                                 %排除背景像素   
        N=N(2:numel(N),1);   
    end   
    for i=1:numel(N)   
        [x y]=find(im==N(i));                  %找到图片中标号为一类的所有坐标   
        flog=1;   
        for t=1:numel(x)   
            if ((x(t)-1)==0)||((y(t)-1)==0)||((x(t)+1)>row)||((y(t)+1)>col)                         %找到边界线点，排除他  
                continue;   
            else   
                if (im(x(t)-1,y(t))~= N(i))||(im(x(t)+1,y(t))~= N(i))||(im(x(t),y(t)-1)~= N(i))||(im(x(t),y(t)+1)~= N(i)) %找到一类图像上的边框点  
                    X(flog)=x(t);   
                    Y(flog)=y(t);   
                    flog=flog+1;   
                end   
            end   
        end   
        val=zeros(row,col);                         %创建输入图像大小的全零矩阵   
        val((Y-1)*row+X)=1;                         %将其一类图像的的边框存入全零矩阵   
        bd(N(i))={logical(sparse(val))};    %将这个带有图像边框的矩阵以稀疏矩阵的方式存入元胞数组对应的边框分类中   
        X=zeros(0);Y=zeros(0);                      % X,Y矩阵归零处理，方便下次重新存储坐标   
    end   
    GTcls.Boundaries=bd;   
    GTcls.Segmentation=im;   
    GTcls.CategoriesPresent=N';   
    save_path=fullfile('D:\数据集\3Dircadb\新建文件夹\liver256_2_8bit_mat',strcat(Path(k).name(1:5),'.mat'));  
    save(save_path,'GTcls');   
 end  