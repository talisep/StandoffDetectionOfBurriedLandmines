%for fit use  z=1/(a*cos(x)*cos(y+el_0)+b*sin(x)*cos(y+el_0)+c*sin(y+el_0)) 
close all
clear all
data = matfile('field_data.mat','Writable',true);

alpha = data.ELV;
beta = data.AZM;
%r = data.Rmeas;
%r = sqrt((data.Rmeas-0.15).^2 + 0.6^2);
% VECTORS ARE READY
% calculating fit, plotting, creating a formula and updating global vars
r = 23*ones(1,24);
[R,a,b,c,beta_0,alpha_0]= create_surf_fit(beta, alpha, r, 9.7,23);


% we will take one step on x axis and one step on y axis in order to define
% v and w, u we have for free. parametric equation is x = u+sv+tw therefore
% s and t are enought to plot on our uv plane 

% order of appearance is 0 -> X -> Y 
 
V_beta = [beta(1) beta(2) beta(3)]'; 
V_alpha = [alpha(1) alpha(2) alpha(3)]';

[u,v,w,dAzm,dElv,spAzm,spElv] = find_u_v_w(V_beta,V_alpha,beta_0,alpha_0,R);

%transformation function from azimuth elevation radius plane to u,v plane
%for a single point !!! (to use every step after calculating the appropriate radius)

Xs = data.Xs;
Ys = data.Ys;

s = zeros(1,length(Xs));
t = zeros(1,length(Ys));


for i=1:length(Xs)  
    
[s(i),t(i)] = alph_bet2uv_plane(beta(i),alpha(i),beta_0,alpha_0,u,v,w,R);

end

s_ERR = abs(s-Xs);
t_ERR = abs(t-Ys);

[max_sErr,inds] = max(s_ERR);
[max_tErr,indt] = max(t_ERR);

figure(3)
scatter(s,t,'r');
hold on
scatter(Xs,Ys);

title(['measured V,W to fitted V,W: maxErrV=',num2str(max_sErr),'maxErrW=',num2str(max_tErr)]);
xlabel('V[m]');
ylabel('W[m]');



