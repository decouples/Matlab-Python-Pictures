% 原始的方式，例子1
tic
MAX_CNT = 1000000;
for i=1:MAX_CNT
    x(i) = i^2;
end
toc
%%
% 加速方式1
tic
MAX_CNT2 = 1000000;
X = zeros(1,MAX_CNT2);
for i=1:MAX_CNT2
    x(i)=i^2;
end
toc
%%
% 加速方式2
tic
MAX_CNT3 = 1000000;
i = 1:MAX_CNT;
x = i.^2;
toc
%% 例子2
% 原始的方式
tic
i = 0;
for t = 0:pi/4:2*pi
    i = i+1;
    x1(i) = sin(t);
end
toc
%%
% 加速方式
tic
t1 = 0:pi/4:2*pi;
x2 = sin(t1);
toc
%%

