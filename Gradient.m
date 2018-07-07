function [ dfdx,dgdx ] = Gradient( designVec )
%Gradient Calculating gradients of objective functions and constraints
%   
%   Inputs: 
%       designVec
%   Outputs:
%       gradients of the objective function
%       gradients of the constraints 
%

%% Creating gradients of the design point.

% Design point for which gradients are computed 
x = designVec;

% Forward finite diffence gradients of objective function and constraints
hx = 1e-8;
fx = thrust(x);
gx = constraintNormal(x);
dgdx=zeros(length(x),length(gx));
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

