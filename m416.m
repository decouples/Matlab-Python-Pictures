m = zeros(10,10);
m(5:8,5:8) = 1;
n = uint8(m);
%imwrite(n,'test.png');
figure,imshow(n);
figure,imshow(im2bw(n));
cc = cat(3,n,n,n);
hh = rgb2gray(cc);
figure,imshow(hh);