close All;
load('allData6.mat');

figure(1);
plotMap;
savefig('map.fig');
saveas(gcf,'map.jpg');

figure(2);
mesh(Xq,Yq,Vq0Avg);
plotMap;
colorbar;
savefig('scanZT.fig');
saveas(gcf,'scanZT.jpg');

figure(3);
mesh(Xq,Yq,VqAvg);
plotMap;
colorbar;
savefig('scanAvg.fig');
saveas(gcf,'scanAvg.jpg');

figure(4);
surf(Xd,Yd,Vd_pyramid,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
plotMap;
colorbar;
savefig('pyramid6.fig');
saveas(gcf,'pyramid6.jpg');

figure(5);
perc = 60;%%this is thresholdlevel!!
mat = Vd_pyramid;
max = nanmax(nanmax(mat));

thresh = ones(size(mat))*(perc/100)*max;

mat(mat<thresh)=0;


surf(Xd,Yd,mat,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
plotMap;
colorbar;
savefig('tho6.fig');
saveas(gcf,'tho6.jpg');
