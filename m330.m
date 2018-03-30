% f = imread('02.bmp');
% % imtool(f)
% I = imresize(f,3);
% figure,imshow(I)
% 
% I3 = imrotate(f,35,'bilinear','crop');
% figure,imshow(I3)

%%
% I = imread('622.tif');
% I = rgb2gray(I);
% sx=2;sy=2;
% T = maketform('affine',[sx 0 0;0 sy 0;0 0 1]);
% I2 = imtransform(I,T);
% imshow(I2),title('Using affine transform')
% I3 = imresize(I,2);
% figure,imshow(I3),title('Using image resizing');
%%
% I = imread('622.tif');
% I = rgb2gray(I);
% theta = 35*pi/180;
% xform=[cos(theta) sin(theta) 0;-sin(theta) cos(theta) 0;0 0 1];
% T = maketform('affine',xform);
% I4 = imtransform(I,T);
% imshow(I4),title('Using affine trabsformtion');
% I5 = imrotate(I,35);
% figure,imshow(I5),title('Using image rotation');
%%
% I = imread('622.tif');
% I = rgb2gray(I);
% delta_x = 50;
% delta_y = 100;
% xform = [1 0 delta_x;0 1 delta_y;0 0 1];
% tform_translate = maketform('affine',xform);% 有点问题
% I6 = imtransform(I,tform_translate,'Xdata',[1 (size(I,2)+xform(3,1))],...
%     'Ydata',[1 (size(I,1)+xform(3,2))],'FillValues',128);
% figure,imshow(I6);
%%





