% 关于waitbar上显示出百分比的用法
%%
% 总数没有超过100的时候
steps=100;
hwait=waitbar(0,'请等待>>>>>>>>');
for k=1:steps
    if steps-k<=5
        waitbar(k/steps,hwait,'即将完成');
        pause(0.05);
    else
        str=['正在运行中',num2str(k),'%'];
        waitbar(k/steps,hwait,str);
        pause(0.05);
    end
end
close(hwait)

%%
% 总数超过100的时候
steps=150;
hwait=waitbar(0,'请等待>>>>>>>>');
step=steps/100;
for k=1:steps
    if steps-k<=5
        waitbar(k/steps,hwait,'即将完成');
        pause(0.05);
    else
        PerStr=fix(k/step);
        str=['正在运行中',num2str(PerStr),'%'];
        waitbar(k/steps,h,str);
        pause(0.05);
    end
end
close(h);