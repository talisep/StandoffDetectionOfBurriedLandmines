function [s,t] = alph_bet2uv_plane(beta,alpha,beta_0,alpha_0,u,v,w,R)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

r = R(beta,alpha);

beta_r = beta+beta_0;
alph_r = alpha+alpha_0;

[x,y,z] = alph_bet2cart(beta_r,alph_r,r);

s = dot(([x y z] - u),v); 
t = dot(([x y z] - u),w);


end

