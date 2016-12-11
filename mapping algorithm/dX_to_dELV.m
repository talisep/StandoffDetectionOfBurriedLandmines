function [delv] = dX_to_dELV(dx,beta1,alpha1,beta_0,alpha_0,R)

beta2 = beta1;
alpha2 = alpha1 + 0.01;

beta_1 = beta1+beta_0;
alpha_1 = alpha1+alpha_0;
beta_2 = beta2+beta_0;
alpha_2 = alpha2+alpha_0;

R1 = R(beta1,alpha1);
R2 = R(beta2,alpha2);

[V1x,V1y,V1z] = alph_bet2cart(beta_1,alpha_1,R1);
[V2x,V2y,V2z] = alph_bet2cart(beta_2,alpha_2,R2);

V1 = [V1x,V1y,V1z];
V2 = [V2x,V2y,V2z];

Vdx = dx*((V2-V1)/sqrt(dot((V2-V1),(V2-V1))));

Vout = V1+Vdx;

[~,alpha,~]  = cart2alph_bet(Vout(1),Vout(2),Vout(3));
delv = alpha-alpha_1;
end