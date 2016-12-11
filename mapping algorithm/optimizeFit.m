


function [Ropt,a_factor,b_factor,WErr,VErr] = optimizeFit(alpha_0,beta_0,a,b,c,alpha,beta,Xs,Ys,WErrmin,VErrmin)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

Rorg = @(beta,alpha,a_factor,b_factor) (1./(a*a_factor.*cos(beta+beta_0)+b*b_factor.*sin(beta+beta_0).*cos(alpha+alpha_0)+c.*sin(alpha+alpha_0).*sin(beta+beta_0)));
set(0,'RecursionLimit',1000);
index_iter = 100;
loop = 0;
while(index_iter==100 && loop<=10)
[Ropt,a_factor,b_factor,WErr,VErr,s,t,index_iter] = recursiveOptimizeFit(1,1,1,1,-1,-1,alpha,beta,alpha_0,beta_0,Xs,Ys,Rorg,0,WErrmin,VErrmin);
loop = loop+1;
end

scatter(s,t,'r');
hold on
scatter(Xs,Ys);

title(['measured V,W to fitted V,W: maxErrV=',num2str(VErr),'maxErrW=',num2str(WErr)]);
xlabel('V[m]');
ylabel('W[m]');



end

function [Ropt,a_factor,b_factor,WErr,VErr,s,t,index] = recursiveOptimizeFit(WErr,VErr,a_factor,b_factor,da_factor,db_factor,alpha,beta,alpha_0,beta_0,Xs,Ys,Rorg,index,WErrmin,VErrmin)
Ropt = @(beta,alpha) Rorg(beta,alpha,a_factor,b_factor);

[thisVErr,thisWErr,s,t] = reFIT(alpha,beta,alpha_0,beta_0,Xs,Ys,Ropt);
%%stop condition
if(index==100||(thisWErr<=WErrmin&&thisVErr<VErrmin))
    WErr=thisWErr;
    VErr=thisVErr;
return;
end

if(rand>0.1)
    if(thisWErr>WErr)
        db_factor = -db_factor/2;
    end
[Ropt,a_factor,b_factor,WErr,VErr,s,t,index] = recursiveOptimizeFit(thisWErr,thisVErr,a_factor,b_factor+db_factor,da_factor,db_factor,alpha,beta,alpha_0,beta_0,Xs,Ys,Rorg,index+1,WErrmin,VErrmin);
else
     if(thisVErr>VErr)
        da_factor = -da_factor/2;
     end
[Ropt,a_factor,b_factor,WErr,VErr,s,t,index] = recursiveOptimizeFit(thisWErr,thisVErr,a_factor+da_factor,b_factor,da_factor,db_factor,alpha,beta,alpha_0,beta_0,Xs,Ys,Rorg,index+1,WErrmin,VErrmin);
end

end