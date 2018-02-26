% 本程序实现求角二阶矩
tic
pix = [0 0 1 1;0 0 1 1;0 2 2 2;2 2 3 3]
[m,n] = size(pix);
L=4;
q=double(zeros(L,L));
for i=1:m-1
    for j=1:n-1
        q(pix(i,j)+1,pix(i+1,j+1)+1)=q(pix(i,j)+1,pix(i+1,j+1)+1)+1;
    end
end
for i=2:m
    for j=2:n
        q(pix(i,j)+1,pix(i-1,j-1)+1)=q(pix(i,j)+1,pix(i-1,j-1)+1)+1;
    end
end
R=2*(L-1)*(L-1);
cl=0;
for i=1:L
    for j=1:L
        q(i,j)=q(i,j)/R;
        cl=cl+q(i,j)^2;
    end
end
q
cl
toc

        