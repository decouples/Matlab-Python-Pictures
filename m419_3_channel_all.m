% 2018-04-19
% @lin

imgPath = 'E:\肝部数据\第二三期CT文件\002-003\liheping\00\';       
imgDir  = dir([imgPath '*.png']);    

imgPath2 = 'E:\肝部数据\第二三期CT文件\002-003\liheping\02\';        
imgDir2  = dir([imgPath2 '*.png']);
imgPath3 = 'E:\肝部数据\第二三期CT文件\002-003\liheping\03\';        
imgDir3  = dir([imgPath3 '*.png']);

imgPath4 = 'E:\肝部数据\第二三期CT文件\002-003\liheping\02_la\';
imgPath5 = 'E:\肝部数据\第二三期CT文件\002-003\liheping\03_la\';

imgPath6 = 'E:\肝部数据\第二三期CT文件\002-003\liheping\02_liv_pa\';
imgPath7 = 'E:\肝部数据\第二三期CT文件\002-003\liheping\03_liv_pa\';

imgPath8 = 'E:\肝部数据\第二三期CT文件\002-003\liheping\02_liv_no\';
imgPath9 = 'E:\肝部数据\第二三期CT文件\002-003\liheping\03_liv_no\';

for i = 1:length(imgDir)
    I = imread([imgPath imgDir(i).name]); % 第一期的标签
    J = imread([imgPath2 imgDir2(i).name]);% CT2
    K = imread([imgPath3 imgDir3(i).name]);% CT3
    J1 = uint8(zeros(512,512,3));
    K1 = uint8(zeros(512,512,3));
    [m,n,~] = size(J);
    for ii = 1:m
        for jj = 1:n
            if I(ii,jj)~=0
                J1(ii,jj,:) = J(ii,jj,:);
                K1(ii,jj,:) = K(ii,jj,:);
            else
                J1(ii,jj,:) =0;
            end
        end
    end
    for mm = 1:m
        for nn = 1:n
            if J(mm,nn,1)~=J(mm,nn,2)||J(mm,nn,1)~=J(mm,nn,3)||J(mm,nn,3)~=J(mm,nn,2)
                J(mm,nn,:) = 0;
            if K(mm,nn,1)~=K(mm,nn,2)||K(mm,nn,1)~=K(mm,nn,3)||K(mm,nn,3)~=K(mm,nn,2)
                K(mm,nn,:) = 0;
            end
            end
        end
    end
% 	new_name = strcat('zhengzhonglin',imgDir(i).name(4:end-4));
%   imwrite(I,strcat(imgPath3,strcat(new_name,'.png')));
    imwrite(I,strcat(imgPath4,imgDir2(i).name));% 2
    imwrite(I,strcat(imgPath5,imgDir3(i).name));% 3
    imwrite(J1,strcat(imgPath6,imgDir2(i).name));% 2
    imwrite(K1,strcat(imgPath7,imgDir3(i).name));% 3   
    imwrite(J,strcat(imgPath8,imgDir2(i).name));% 2
    imwrite(K,strcat(imgPath9,imgDir3(i).name));% 3     
end