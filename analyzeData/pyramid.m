function [Xd,Yd,Vd_pyramid] = pyramid( Vq0Avg,VqAvg,order)
Vq0root = Vq0Avg.^(1/order);
Vp = VqAvg;

for i=1:order
  Vp = Vp./Vq0root;
  Vq0root = impyramid(Vq0root,'reduce');
  Vp = impyramid(Vp,'reduce');
end
  
Vd_pyramid = Vp;
Xd = [0:0.001*(2^order):3.8];
Yd = [0:0.001*(2^order):1.1];
end

