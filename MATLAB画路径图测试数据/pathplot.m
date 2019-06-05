clc
clear
A = xlsread('adjoin.xlsx');
B = xlsread('pos.xlsx');
C1 = xlsread('ALinepath3.xlsx');
C2 = xlsread('BLinepath3.xlsx');
C3 = xlsread('CLinepath3.xlsx');
cnt1 = 1;
for i = 1:6
    for j = 1:7
        if (C1(i,j) > 0 && C1(i,j + 1) > 0)
          D1(cnt1,1) = C1(i,j);
          D1(cnt1,2) = C1(i,j + 1);
          cnt1 = cnt1 + 1;
        end
    end
end

cnt2 = 1;
for i = 1:6
    for j = 1:7
        if (C2(i,j) > 0 && C2(i,j + 1) > 0)
          D2(cnt2,1) = C2(i,j);
          D2(cnt2,2) = C2(i,j + 1);
          cnt2 = cnt2 + 1;
        end
    end
end

cnt3 = 1;
for i = 1:12
    for j = 1:7
        if (C3(i,j) > 0 && C3(i,j + 1) > 0)
          D3(cnt3,1) = C3(i,j);
          D3(cnt3,2) = C3(i,j + 1);
          cnt3 = cnt3 + 1;
        end
    end
end


figure(1)
gplot(A,B,'-o');
hold on
line([B(69,1) B(70,1)] , [B(69,2) B(70,2)],'color','r');
line([B(D1(1,1),1) B(D1(1,2),1)] , [B(D1(1,1),2) B(D1(1,2),2)],'color','c');
hold on
for l = 69:78
    line([B(l,1) B(l + 1,1)] , [B(l,2) B(l + 1,2)],'color','r');
    line([B(l,1)+0.5 B(l + 1,1)+0.5] , [B(l,2) B(l + 1,2)],'color','r');
end
hold on
for l = 80:87
   line([B(l,1) B(l + 1,1)] , [B(l,2) B(l + 1,2)],'color','r');
   line([B(l,1)+0.5 B(l + 1,1)+0.5] , [B(l,2) B(l + 1,2)],'color','r');
end
hold on
for k = 1:cnt1 - 1
    line([B(D1(k,1),1) B(D1(k,2),1)] , [B(D1(k,1),2) B(D1(k,2),2)],'color','c');
end
hold on
for i = 1:130
    x(i) = B(i,1);
end
for i = 1:130
    y(i) = B(i,2);
end
ch = {'D1';'D2';'Z1';'Z2';'Z3';'Z4';'Z5';'Z6';'F1';'F2';'F3';'F4';'F5';'F6';'F7';'F8';'F9';'F10';'F11';'F12';'F13';'F14';'F15';'F16';'F17';'F18';'F19';'F20';'F21';'F22';'F23';'F24';'F25';'F26';'F27';'F28';'F29';'F30';'F31';'F32';'F33';'F34';'F35';'F36';'F37';'F38';'F39';'F40';'F41';'F42';'F43';'F44';'F45';'F46';'F47';'F48';'F49';'F50';'F51';'F52';'F53';'F54';'F55';'F56';'F57';'F58';'F59';'F60';'J1';'J2';'J3';'J4';'J5';'J6';'J7';'J8';'J9';'J10';'J11';'J12';'J13';'J14';'J15';'J16';'J17';'J18';'J19';'J20';'J21';'J22';'J23';'J24';'J25';'J26';'J27';'J28';'J29';'J30';'J31';'J32';'J33';'J34';'J35';'J36';'J37';'J38';'J39';'J40';'J41';'J42';'J43';'J44';'J45';'J46';'J47';'J48';'J49';'J50';'J51';'J52';'J53';'J54';'J55';'J56';'J57';'J58';'J59';'J60';'J61';'J62';};
for i = 1:130
    text(x(i)+0.01,y(i),ch(i));
end
% plot(x(4),y(4),'.','MarkerSize',15,'color','r');
% plot(x(5),y(5),'.','MarkerSize',15,'color','r');
% plot(x(6),y(6),'.','MarkerSize',15,'color','r');
% plot(x(7),y(7),'.','MarkerSize',15,'color','r');
% plot(x(8),y(8),'.','MarkerSize',15,'color','r');
for i = 1:6
     plot(x(C1(i,1)),y(C1(i,1)),'.','MarkerSize',15,'color','r');
end
title('A类发射装置第二波次转载到发射点的分配方案');
legend('结点','主干道','A的分配方案');
hold off

figure(2)
gplot(A,B,'-o');
line([B(69,1) B(70,1)] , [B(69,2) B(70,2)],'color','r');
line([B(D2(1,1),1) B(D2(1,2),1)] , [B(D2(1,1),2) B(D2(1,2),2)],'color','g');
hold on
for l = 69:78
    line([B(l,1) B(l + 1,1)] , [B(l,2) B(l + 1,2)],'color','r');
    line([B(l,1)+0.5 B(l + 1,1)+0.5] , [B(l,2) B(l + 1,2)],'color','r');
end
hold on
for l = 80:87
   line([B(l,1) B(l + 1,1)] , [B(l,2) B(l + 1,2)],'color','r');
   line([B(l,1)+0.5 B(l + 1,1)+0.5] , [B(l,2) B(l + 1,2)],'color','r');
end
hold on
for k = 1:cnt2 - 1
    line([B(D2(k,1),1) B(D2(k,2),1)] , [B(D2(k,1),2) B(D2(k,2),2)],'color','g');
end
hold on
for i = 1:130
    x(i) = B(i,1);
end
for i = 1:130
    y(i) = B(i,2);
end
ch = {'D1';'D2';'Z1';'Z2';'Z3';'Z4';'Z5';'Z6';'F1';'F2';'F3';'F4';'F5';'F6';'F7';'F8';'F9';'F10';'F11';'F12';'F13';'F14';'F15';'F16';'F17';'F18';'F19';'F20';'F21';'F22';'F23';'F24';'F25';'F26';'F27';'F28';'F29';'F30';'F31';'F32';'F33';'F34';'F35';'F36';'F37';'F38';'F39';'F40';'F41';'F42';'F43';'F44';'F45';'F46';'F47';'F48';'F49';'F50';'F51';'F52';'F53';'F54';'F55';'F56';'F57';'F58';'F59';'F60';'J1';'J2';'J3';'J4';'J5';'J6';'J7';'J8';'J9';'J10';'J11';'J12';'J13';'J14';'J15';'J16';'J17';'J18';'J19';'J20';'J21';'J22';'J23';'J24';'J25';'J26';'J27';'J28';'J29';'J30';'J31';'J32';'J33';'J34';'J35';'J36';'J37';'J38';'J39';'J40';'J41';'J42';'J43';'J44';'J45';'J46';'J47';'J48';'J49';'J50';'J51';'J52';'J53';'J54';'J55';'J56';'J57';'J58';'J59';'J60';'J61';'J62';};
for i = 1:130
    text(x(i)+0.01,y(i),ch(i));
end
% plot(x(4),y(4),'.','MarkerSize',15,'color','r');
% plot(x(6),y(6),'.','MarkerSize',15,'color','r');
% plot(x(8),y(8),'.','MarkerSize',15,'color','r');
for i = 1:6
     plot(x(C2(i,1)),y(C2(i,1)),'.','MarkerSize',15,'color','r');
end
title('B类发射装置第二波次转载到发射点的分配方案');
legend('结点','主干道','B的分配方案');
hold off

figure(3)
gplot(A,B,'-o');
line([B(69,1) B(70,1)] , [B(69,2) B(70,2)],'color','r');
line([B(D3(1,1),1) B(D3(1,2),1)] , [B(D3(1,1),2) B(D3(1,2),2)],'color','y');
hold on
for l = 69:78
    line([B(l,1) B(l + 1,1)] , [B(l,2) B(l + 1,2)],'color','r');
    line([B(l,1)+0.5 B(l + 1,1)+0.5] , [B(l,2) B(l + 1,2)],'color','r');
end
hold on
for l = 80:87
   line([B(l,1) B(l + 1,1)] , [B(l,2) B(l + 1,2)],'color','r');
   line([B(l,1)+0.5 B(l + 1,1)+0.5] , [B(l,2) B(l + 1,2)],'color','r');
end
hold on
for k = 1:cnt3 - 1
    line([B(D3(k,1),1) B(D3(k,2),1)] , [B(D3(k,1),2) B(D3(k,2),2)],'color','y');
end
hold on
for i = 1:130
    x(i) = B(i,1);
end
for i = 1:130
    y(i) = B(i,2);
end
ch = {'D1';'D2';'Z1';'Z2';'Z3';'Z4';'Z5';'Z6';'F1';'F2';'F3';'F4';'F5';'F6';'F7';'F8';'F9';'F10';'F11';'F12';'F13';'F14';'F15';'F16';'F17';'F18';'F19';'F20';'F21';'F22';'F23';'F24';'F25';'F26';'F27';'F28';'F29';'F30';'F31';'F32';'F33';'F34';'F35';'F36';'F37';'F38';'F39';'F40';'F41';'F42';'F43';'F44';'F45';'F46';'F47';'F48';'F49';'F50';'F51';'F52';'F53';'F54';'F55';'F56';'F57';'F58';'F59';'F60';'J1';'J2';'J3';'J4';'J5';'J6';'J7';'J8';'J9';'J10';'J11';'J12';'J13';'J14';'J15';'J16';'J17';'J18';'J19';'J20';'J21';'J22';'J23';'J24';'J25';'J26';'J27';'J28';'J29';'J30';'J31';'J32';'J33';'J34';'J35';'J36';'J37';'J38';'J39';'J40';'J41';'J42';'J43';'J44';'J45';'J46';'J47';'J48';'J49';'J50';'J51';'J52';'J53';'J54';'J55';'J56';'J57';'J58';'J59';'J60';'J61';'J62';};
for i = 1:130
    text(x(i)+0.01,y(i),ch(i));
end
hold on
% plot(x(3),y(3),'.','MarkerSize',15,'color','r');
% plot(x(5),y(5),'.','MarkerSize',15,'color','r');
% plot(x(6),y(6),'.','MarkerSize',15,'color','r');
% plot(x(7),y(7),'.','MarkerSize',15,'color','r');
for i = 1:6
     plot(x(C3(i,1)),y(C3(i,1)),'.','MarkerSize',15,'color','r');
end
legend('结点','主干道','C的分配方案');
title('C类发射装置第二波次转载到发射点的分配方案');
hold off




