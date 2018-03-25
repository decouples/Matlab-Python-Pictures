%     I = imread('./01/00817.bmp'); %原始图
%     J = imread('./03/lin_00817.png');%label图
%     K = imread('./02/lin_00817.png');
%     la = im2bw(K);
%     J =  im2bw(J);
%     
%     I = rgb2gray(I);
%     for m = 1:512
%         for n=1:512
%             if(J(m,n) ~=0)
%                 G(m,n,1) = 0;G(m,n,2) = 255;G(m,n,3) = 0;
%                 if (la(m,n) ==1)
%                     G(m,n,1) =255;G(m,n,2)=255;G(m,n,3)=0;
%                 else
%                     G(m,n,1) = 0;G(m,n,2) = 100;G(m,n,3) = 0;
%                 end
%             else
%                 G(m,n,1) = I(m,n);G(m,n,2) = I(m,n);G(m,n,3) = I(m,n);
%             end
%         end
%     end
%     G=uint8(G);
%     imwrite(G,'test817.png')
%%
%单一的肝部与肿瘤的显示
f = imread('./04/00817.bmp');
g = imread('./04/00lin_00817.png');
g = im2bw(g);

for i=1:512
    for j=1:512
        if (g(i,j)==1)
            K(i,j,1)=0;K(i,j,2)=100;K(i,j,3)=0;
        else
            K(i,j,1)=f(i,j,1);K(i,j,2)=f(i,j,2);K(i,j,3)=f(i,j,3);
        end
    end
end
imwrite(K,'my0817.png')
%%
% f = imread('./03/test0024.png');
% g = imread('./03/mask_13.png');
% g = im2bw(g);
% 
% for i=1:512
%     for j=1:512
%         if (g(i,j)==1)
%             K(i,j,1)=0;K(i,j,2)=100;K(i,j,3)=0;
%         else
%             K(i,j,1)=f(i,j,1);K(i,j,2)=f(i,j,2);K(i,j,3)=f(i,j,3);
%         end
%     end
% end
% imwrite(K,'my.png')


