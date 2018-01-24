
imgPath1 = 'D:/数据集/3Dircadb/original_CT/liver_20_patient/';
% imgPath2 = 'E:/3Dircadb/liver_tumor/原始文件/liver_17_livertumor2/';
% imgPath3 = 'E:/3Dircadb/liver_tumor/原始文件/liver_08_livertumor03/';
% imgPath4 = 'E:/3Dircadb/liver_tumor/原始文件/liver_01_livertumor04/';
% imgPath5 = 'E:/3Dircadb/liver_tumor/原始文件/liver_01_livertumor05/';
% imgPath6 = 'E:/3Dircadb/liver_tumor/原始文件/liver_01_livertumor06/';
% imgPath7 = 'E:/3Dircadb/liver_tumor/原始文件/liver_01_livertumor07/';
imgDir1 = dir([imgPath1 '*.bmp']);
% imgDir2 = dir([imgPath2 '*.bmp']);
% imgDir3 = dir([imgPath3 '*.bmp']);
% imgDir4 = dir([imgPath4 '*.bmp']);
% imgDir5 = dir([imgPath5 '*.bmp']);
% imgDir6  = dir([imgPath6 '*.bmp']);
% imgDir7  = dir([imgPath7 '*.bmp']);
for i = 1:length(imgDir1)
    im1 = imread([imgPath1 imgDir1(i).name]);
% 	im2 = imread([imgPath2 imgDir2(i).name]);
% 	im3 = imread([imgPath3 imgDir3(i).name]);
%   im4 = imread([imgPath4 imgDir4(i).name]);
% 	im5 = imread([imgPath5 imgDir5(i).name]);
% 	im6 = imread([imgPath6 imgDir6(i).name]);
%     im7 = imread([imgPath7 imgDir7(i).name]);
	%%
    km = zeros(512,512);
%     for k = 60:460
%         for m= 40:460
%             if im1(k,m) ~= 0
% 			    km(k, m) = im1(k,m);
%             elseif im2(k,m) ~= 0
%                 km(k,m) = im2(k,m);
%             elseif im3(k,m) ~= 0
% 			    km(k,m) = im3(k,m);
%             elseif im4(k,m) ~= 0
% 			    km(k,m) = im4(k,m);
%             elseif im5(k,m) ~= 0
% 			    km(k,m) = im5(k,m);
%             elseif im6(k,m) ~= 0
% 			    km(k,m) = im6(k,m);
%             elseif im7(k,m) ~= 0
% 			    km(k,m) = im7(k,m);
%             end
%         end
%     end
    my(:,:,1) = km;my(:,:,2) = km;my(:,:,3) = km;
    imwrite(my,strcat(imgDir1(i).name,'.png'));
end