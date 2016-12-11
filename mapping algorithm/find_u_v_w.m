

function [u,v,w,dAzm,dElv,spAzm,spElv] = find_u_v_w(V_beta,V_alpha,beta_0,alpha_0,R)
%transform defining vectors radial to cartesian

Vr = R(V_beta,V_alpha);
Vbeta = V_beta+beta_0;
Valpha = V_alpha+alpha_0;

V1c = [0 0 0]; %zero point
V2c = [0 0 0]; %marks x axis
V3c = [0 0 0]; %marks y axis


% x y z                          azimuth elevation radius
[V1c(1),V1c(2),V1c(3)] =alph_bet2cart(Vbeta(1),Valpha(1),Vr(1));
[V2c(1),V2c(2),V2c(3)] =alph_bet2cart(Vbeta(2),Valpha(2),Vr(2));
[V3c(1),V3c(2),V3c(3)] =alph_bet2cart(Vbeta(3),Valpha(3),Vr(3));

%surface parametric formula x = u + sv + tw
u = V1c;
%now we find v and w !
% data.v = (V2c-V1c)/sqrt(dot((V2c-V1c),(V2c-V1c)))
% data.w = (V3c-V1c)/sqrt(dot((V3c-V1c),(V3c-V1c)))
v = (V2c-V1c)/sqrt(dot((V2c-V1c),(V2c-V1c)));%suppose to mark x 

%calculate an othonormal vector !
orth_wv = dot((V3c-V1c),v);
w = ((V3c-V1c)-orth_wv*v)/sqrt(dot(((V3c-V1c)-orth_wv*v),((V3c-V1c)-orth_wv*v)));%suppose to mark


dAzm = abs(Vbeta(2)-Vbeta(3));
dElv = abs(Valpha(2)-Valpha(3));

if (dAzm > abs(Vbeta(2)-Vbeta(1)))
    dAzm = -dAzm;
    spAzm = V_beta(3);
else
    dAzm = Vbeta(2)-Vbeta(1);
    spAzm = V_beta(1);
end
    
if(dElv>abs(Valpha(3)-Valpha(1)))
    dElv = dElv;
    spElv = V_alpha(2);
else
    dElv = Valpha(3)-Valpha(1);
    spElv = V_alpha(1);
end

end

