function [mu] = lagrangeMult( designVec )
%lagrangeMult calculates the lagrange multipliers with least squares
%  Input:
%   designVec
%  Output:
%   mu (the lagrange multipliers)
%


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
mu=x\y;


end

