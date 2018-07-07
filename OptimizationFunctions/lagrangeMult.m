function [mu,gbar] = lagrangeMult( designVec )
%lagrangeMult calculates the lagrange multipliers with least squares
%  Input:
%   designVec   = vector of design elements,(1) throat radius ,(2)
%   expansion ratio, optional (3) thickness, optional (4) throat divergence
%   half angle, optionel (5) exit divergence half angle
%  Output:
%   mu          = array of the lagrange multipliers
%   gbar        = gradient matrix of active constraints


% Importing gradients
[fgrad,ggrad]=Gradient(designVec);
% creating gbar matrix with active constraints
g=constraintNormal(designVec);
g0=abs(g)<0.001;
gbar=ggrad(:,g0);
% Least sqares approximation of the lagrange multipliers
% Gbar with transpose gbar
x=gbar'*gbar;
% fgrad with gbar transpose
y=gbar'*fgrad;
%solving
mu=-x\y;


end

