
%%
% g1 = zeros(600,600);
% g1(100:500,250:350)=1;
% g2 = phantom('Modified Shepp-Logan',600);
% imshow(g1);
% figure,imshow(g2);
% %%
% theta = 0:0.5:179.5;
% [R1,xp1] = radon(g1,theta);
% [R2,xp2] = radon(g2,theta);
% 
% R1 = flipud(R1');
% R2 = flipud(R2');
% figure,imshow(R1,[],'XData',xp1([1 end]),'YData',[179.5 0]);
% axis xy
% hold on
% xlabel('\rho'),ylabel('\theta')
% figure,imshow(R2,[],'Xdata',xp2([1 end]),'YData',[179.5 0]);
% axis xy
% axis on
% xlabel('\rho'),ylabel('\theta');

%%
% g1 = zeros(600,600);
% g1(100:500,250:350)=1;
% g2 = phantom('Modified Shepp-Logan',600);
% imshow(g1);
% figure,imshow(g2);
% %%
% theta = 0:0.5:179.5;
% R1 = radon(g1,theta);
% R2 = radon(g2,theta);
% f1 = iradon(R1,theta,'none');
% f2 = iradon(R2,theta,'none');
% figure,imshow(f1,[]);
% figure,imshow(f2,[]);
% 
% f1ram = iradon(R1,theta);
% f2ram = iradon(R2,theta);
% figure,imshow(f1ram,[])
% figure,imshow(f2ram,[])
% 
% f1_hamm = iradon(R1,theta,'Hamming');
% f2_hamm = iradon(R2,theta,'Hamming');
% figure,imshow(f1_hamm,[]);
% figure,imshow(f2_hamm,[]);
% 
% f1_near = iradon(R1,theta,'nearest');
% f1_lin = iradon(R1,theta,'linear');
% f1_cub = iradon(R1,theta,'cubic');
% figure,imshow(f1_near,[]);
% figure,imshow(f1_lin,[]);
% figure,imshow(f1_cub,[]);
%%
% Р§зг 4-14
% g1 = zeros(600,600);
% g1(100:500,250:350) = 1;
% g2 = phantom('Modified Shepp-Logan',600);
% D = 1.5*hypot(size(g1,1),size(g2,2))/2;
% B1_line = fanbeam(g1,D,'FanSensorGeometry','line','FanSensorSpacing',1,'FanRotationIncrement',0.5);
% B1_line = flipud(B1_line');
% B2_line = fanbeam(g2,D,'FanSensorGeometry','line','FanSensorSpacing',1,'FanRotationIncrement',0.5);
% B2_line = flipud(B2_line');
% imshow(B1_line,[]);
% figure,imshow(B2_line,[]);
% 
% B1_arc = fanbeam(g1,D,'FanSensorGeometry','arc','FanSensorSpacing',.08,'FanRotationIncrement',0.5);
% B2_arc = fanbeam(g2,D,'FanSensorGeometry','arc','FanSensorSpacing',.08,'FanRotationIncrement',0.5);
% figure,imshow(flipud(B1_arc'),[]);
% figure,imshow(flipud(B2_arc'),[]);
%%
%Р§зг4-15
g = phantom('Modified Shepp-Logan',600);
D = 1.5*hypot(size(g,1),size(g,2))/2;
B1 = fanbeam(g,D);
f1 = ifanbeam(B1,D);
figure,imshow(f1,[]);

B2 = fanbeam(g,D,'FanRotationIncrement',0.5,'FanSensorSpacing',0.5);
f2 = ifanbeam(B2,D,'FanRotationIncrement',0.5,'FanSensorSpacing',0.5,'Filter','Hamming');
figure,imshow(f2,[]);

B3 =fanbeam(g,D,'FanRotationIncrement',0.5,'FanSensorSpacing',0.05);
f3 = ifanbeam(B3,D,'FanRotationIncrement',0.5,'FanSensorSpacing',0.05,'Filter','Hamming');
figure,imshow(f3,[]);







