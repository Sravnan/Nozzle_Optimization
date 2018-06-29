function [ dfdx,dgdx ] = Gradient( designVec )
%UNTITLED2 Simplex method(Dantzig)
%   Detailed explanation goes here

%% Creating gradients of the design point.

% Design point for which gradients are computed 
x = designVec;

% Forward finite diffence gradients of objective function and constraints
hx = 1e-10;
fx = thrust(x);
gx = constraintNormal(x);
dgdx=zeros(length(x),5);
dfdx=zeros(length(x),1);
for ii=1:length(x)
  xi=x;
  xi(ii)=x(ii)+hx;
  fxplush=thrust(xi);
  dfdx(ii)=(fxplush-fx)/hx;
  
  gxplush=constraintNormal(xi);
  dgdx(ii,:)=(gxplush-gx)/hx;
end



end

