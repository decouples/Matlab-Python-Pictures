a=[1:2116];
fid = fopen('train.txt','wt');
fprintf(fid,'%05g\n',a);
fclose(fid);
%% 

