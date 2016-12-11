% APPLY THRESHOLD ON MATRIX
close all;
perc = 60;
mat = Vd_pyramid;
max = nanmax(nanmax(mat))

thresh = ones(size(mat))*(perc/100)*max;

mat(mat<thresh)=0;


surf(Xd,Yd,mat,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
plotMap;
