% Р§зг 7.8
% f = imread('Fig0708(a).tif');
% figure,imshow(f);
% [c,s] = wavefast(f,1,'sym4');
% figure;wavedisplay(c,s,-6);
% [nc,y] = wavecut('a',c,s);
% figure;wavedisplay(nc,s,-6);
% edges = abs(waveback(nc,s,'sym4'));
% figure,imshow(mat2gray(edges));

%%
% Р§зг 7-9
% f = imread('Fig0708(a).tif');
% [c,s] = wavefast(f,4,'sym4');
% wavedisplay(c,s,20);
% [c,g8] = wavezero(c,s,1,'sym4');
% [c,g8] = wavezero(c,s,2,'sym4');
% [c,g8] = wavezero(c,s,3,'sym4');
% [c,g8] = wavezero(c,s,4,'sym4');

%%
% Р§зг 7-10
f = imread('Fig0709(f).tif');
[c,s] = wavefast(f,4,'jpeg9.7');
wavedisplay(c,s,8);

f = wavecopy('a',c,s);
figure,imshow(mat2gray(f));

[c,s] = waveback(c,s,'jpeg9.7',1);
f = wavecopy('a',c,s);
figure,imshow(mat2gray(f));

[c,s] = waveback(c,s,'jpeg9.7',1);
f = wavecopy('a',c,s);
figure,imshow(mat2gray(f));

[c,s] = waveback(c,s,'jpeg9.7',1);
f = wavecopy('a',c,s);
figure,imshow(mat2gray(f));

[c,s] = waveback(c,s,'jpeg9.7',1);
f = wavecopy('a',c,s);
figure,imshow(mat2gray(f));
%%



