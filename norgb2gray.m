rgb_image=imread('Fig0604(a).tif');
%gray_im=zeros(600,600);
%%
%不用循环的做法
gray_im=rgb_image(:,:,1)*0.3+rgb_image(:,:,2)*0.59+rgb_image(:,:,3)*0.11;
%%
%下面为添加循环的做法
% for i=1:600
%     for j=1:600
%         gray_im(i,j)=rgb_image(i,j,1)*0.3+rgb_image(i,j,2)*0.59+rgb_image(i,j,3)*0.11;
%     end
% end
%%
gray_im=uint8(gray_im);
gray_image=rgb2gray(rgb_image);
figure,imshow(rgb_image);
figure,imshow(gray_im);
figure,imshow(gray_image)
