f = imread('1013a.tif');
count = 0;
T = mean2(f);
done = false;
while ~done
    count = count+1;
    g = f > T;
    Tnext = 0.5*(mean(f(g))+mean(f(~g)));
    done = abs(T - Tnext) < 0.5;
    T = Tnext;
end

count;
T;
g = im2bw(f,T/255);
imshow(f)
figure,imhist(f)
figure,imshow(g)
