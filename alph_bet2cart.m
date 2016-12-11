function [x,y,z] = alph_bet2cart(beta,alpha,r)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes h
x = r.*cos(beta);
y=r.*cos(alpha).*sin(beta);
z =r.*sin(alpha).*sin(beta); 
end

