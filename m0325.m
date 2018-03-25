imgPath1 = 'C:\Users\lilin\Documents\MATLAB\325\01\';        % 图像库路径
imgDir1  = dir([imgPath1 '*.bmp']); % 遍历所有png格式文件
imgPath2 = 'C:\Users\lilin\Documents\MATLAB\325\02\';        %标签
imgDir2  = dir([imgPath2 '*.png']);
imgPath3 = 'C:\Users\lilin\Documents\MATLAB\325\03\';  %保存的最后输出路径

for i = 1:length(imgDir1)
    I = imread([imgPath1 imgDir1(i).name]); %原始图
    J = imread([imgPath2 imgDir2(i).name]);%label图
%     I = rgb2gray(I);
    la = im2bw(J);
%     F = double(I).*double(la);
%     F = uint8(F);
%     G(:,:,1)=F;G(:,:,2)=F;G(:,:,3)=F;
    for m = 1:512
        for n=1:512
            if (la(m,n)==1)
                G(m,n,1) = 255;G(m,n,2) = 255;G(m,n,3) = 0;
            else
                G(m,n,:) = I(m,n,:);
                %I(m,n,1) =255;I(m,n,2)=255;I(m,n,3)=0;
            end
        end
    end
    G = uint8(G);
    imwrite(G,strcat(imgPath3,imgDir2(i).name));
end