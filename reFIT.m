function [VErr,WErr,s,t] = reFIT(alpha,beta,alpha_0,beta_0,Xs,Ys,R)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

close all;

% VECTORS ARE READY
V_beta = [beta(1) beta(2) beta(3)]'; 
V_alpha = [alpha(1) alpha(2) alpha(3)]';
[u,v,w,dAzm,dElv,spAzm,spElv] = find_u_v_w(V_beta,V_alpha,beta_0,alpha_0,R);

s = zeros(1,length(beta));
t = zeros(1,length(beta));

for i=1:length(beta)      
[s(i),t(i)] = alph_bet2uv_plane(beta(i),alpha(i),beta_0,alpha_0,u,v,w,R);
end

s_ERR = abs(s(1:3)-Xs);
t_ERR = abs(t(1:3)-Ys);

[VErr,~] = max(s_ERR);
[WErr,~] = max(t_ERR);

% scatter(s,t,'r');
% hold on
% scatter(Xs,Ys);
% 
% title(['measured V,W to fitted V,W: maxErrV=',num2str(VErr),'maxErrW=',num2str(WErr)]);
% xlabel('V[m]');
% ylabel('W[m]');


end

