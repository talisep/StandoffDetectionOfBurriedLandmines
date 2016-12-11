function [beta,alpha,r] = cart2alph_bet(x,y,z)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes h

r = sqrt(x.^2 + y.^2 +z.^2);
alpha = atan(z./y);
beta = acos(x./r);

end

