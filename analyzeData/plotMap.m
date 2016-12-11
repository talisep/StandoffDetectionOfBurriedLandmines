%% plotting big plastic boxes as a frame 55*35 scm

hold;
cen = 0.55;
zVal = 20;
color = 'black';
lineWidth = 1;
% bigBoxW = 0.55;
% bigBoxL = 0.35;

% Y_bigBox = [cen-0.35 cen cen+0.35 cen+0.35 cen+0.35 cen+0.35 cen+0.35 cen+0.35...
%     ; cen-0.35 cen cen+0.35 cen-0.35 cen-0.35 cen-0.35 cen-0.35 cen-0.35];
% X_bigBox = [0.65 0.65 0.65 0.65 1.2 1.75 2.3 2.85; 2.85 2.85 2.85 0.65 1.2 1.75 2.3 2.85];
% Z_bigBox = ones(size(Y_bigBox));

Y_bigBox = [cen-0.35 cen cen+0.35 cen+0.35 cen+0.35 cen+0.35 cen+0.35 cen+0.35...
    ; cen-0.35 cen cen+0.35 cen-0.35 cen-0.35 cen-0.35 cen-0.35 cen-0.35];
X_bigBox = [0.65 0.65 0.65 0.65 1.2 1.75 2.3 2.85; 2.85 2.85 2.85 0.65 1.2 1.75 2.3 2.85];
Z_bigBox = ones(size(Y_bigBox));

Y_negBox = [cen cen+0.35 cen+0.35 cen cen];
X_negBox=[1.2 1.2 1.75 1.75 1.2];
Z_negBox = ones(size(Y_negBox));


bigBoxPlot = plot3(X_bigBox,Y_bigBox,zVal*Z_bigBox);
negBoxPlot = plot3(X_negBox,Y_negBox,zVal*Z_negBox);
%rectangle('Position',[1.2 cen 0.55 0.35],{'LineStyle'},{'-'}','EdgeColor','green','lineWidth',lineWidth);
set(bigBoxPlot,{'LineStyle'},{'-'}','Color','black','lineWidth',lineWidth);
set(negBoxPlot,{'LineStyle'},{'-'}','Color','green','lineWidth',lineWidth);

%% plotting small sample boxes sized 20*20 scm

Y_sampleBox = [cen+0.1 cen+0.05 cen-0.3 cen-0.25 cen-0.3 cen-0.25 cen+0.05 cen-0.25 ;...
    cen+0.1 cen+0.05 cen-0.3 cen-0.25 cen-0.3 cen-0.25 cen+0.05 cen-0.25;...
    cen+0.3 cen+0.25 cen-0.1 cen-0.05 cen-0.1 cen-0.05 cen+0.25 cen-0.05;...
    cen+0.3 cen+0.25 cen-0.1 cen-0.05 cen-0.1 cen-0.05 cen+0.25 cen-0.05;...
    cen+0.1 cen+0.05 cen-0.3 cen-0.25 cen-0.3 cen-0.25 cen+0.05 cen-0.25];
X_sampleBox = [0.7 0.95 0.7 1 1.25 1.5 3.45 3.45 ;...
    0.9 1.15 0.9 1.2 1.45 1.7 3.65 3.65 ;...
    0.9 1.15 0.9 1.2 1.45 1.7 3.65 3.65 ;...
    0.7 0.95 0.7 1 1.25 1.5 3.45 3.45 ;...
    0.7 0.95 0.7 1 1.25 1.5 3.45 3.45];
Z_sampleBox = ones(size(Y_sampleBox));

sampleBoxPlot = plot3(X_sampleBox,Y_sampleBox,zVal*Z_sampleBox);
set(sampleBoxPlot,{'LineStyle'},{'-'}','Color','black','lineWidth',lineWidth);

%% plotting syrcin sand boxes 30*40 scm

Y_SyrcBox = [cen+0.4 cen cen-0.4 cen+0.4 cen+0.4 cen+0.4;cen+0.4 cen cen-0.4 cen-0.4 cen-0.4 cen-0.4];
X_SyrcBox = [2.85 2.85 2.85 2.85 3.15 3.45; 3.45 3.45 3.45 2.85 3.15 3.45];
Z_SyrcBox = ones(size(Y_SyrcBox));

SyrcBoxPlot = plot3(X_SyrcBox,Y_SyrcBox,zVal*Z_SyrcBox);
set(SyrcBoxPlot,{'LineStyle'},{'-'}','Color','green','lineWidth',lineWidth);



%% plotting burried landmines
% 
% Y_LM = [cen+0.125 cen+0.125 cen-0.225 cen-0.225;...
%     cen+0.125 cen+0.125 cen-0.225 cen-0.225;...
%     cen+0.225 cen+0.225 cen-0.125 cen-0.125;...
%     cen+0.225 cen+0.225 cen-0.125 cen-0.125;...
%     cen+0.125 cen+0.125 cen-0.225 cen-0.225];
% X_LM = [1.95 2.5 1.95 2.5 ; 2.1 2.65 2.1 2.65 ;2.1 2.65 2.1 2.65 ;1.95 2.5 1.95 2.5 ;1.95 2.5 1.95 2.5];
% Z_LM = ones(size(Y_LM));
% 
% LMPlot = plot3(X_LM,Y_LM,zVal*Z_LM);
% set(LMPlot,{'LineStyle'},{'-','-','-','-'}','Color',color,'lineWidth',lineWidth);

%% plotting the positive control as a circle
r = 0.125;
xc = 0.375;
yc = cen-0.05;

theta = linspace(0,2*pi);
x_posControl = r*cos(theta) + xc;
y_posControl = r*sin(theta) + yc;
z_posControl = ones(size(y_posControl));
posControlPlot = plot3(x_posControl,y_posControl,zVal*z_posControl);

set(posControlPlot,{'LineStyle'},{'-'}','Color','red','lineWidth',lineWidth);


%later edit for beautiful figs
view(0,90);
set(gca,'FontWeight','bold');
xlabel('horizontal coordinate[m]');
ylabel('vertical coordinate[m]');
axis([0 3.8 0 1.1]);

