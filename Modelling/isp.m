function [ isp ] = isp( designVec )
%Calculate specific Impulse of Engine at design point
% Inputs:
%   designVec   = vector of design elements,(1) throat radius ,(2)
%   expansion ratio, optional (3) thickness, optional (4) throat divergence
%   half angle, optionel (5) exit divergence half angle
% Oututs:
%   isp         = specific Impulse (s)


%% Check if simplified problem and convert to SI Units
if length(designVec)==2
    rt = 0.001*designVec(1);
    eps = designVec(2);
    t = 0.001*Constants.t;
    theta1 = pi/180*Constants.theta1;
    theta2 = pi/180*Constants.theta2 ;
else
    rt = 0.001*designVec(1);
    eps = designVec(2);
    t = 0.001*designVec(3);
    theta1 =pi/180*designVec(4);
    theta2 = pi/180*designVec(5);
end
%% Calculate exit conditions
pepc = pressureRatioCalc(eps,0.01,1e-6);     % Pressure ratio
Uexit = sqrt(2*Constants.gamma/(Constants.gamma - 1)*Constants.Rspess*Constants.Tcc*(1 - pepc^((Constants.gamma - 1)/Constants.gamma)));
mdot = Constants.VH*Constants.Pcc*pi*rt^2/sqrt(Constants.Rspess*Constants.Tcc);

Ueq = Uexit +  (pepc*Constants.Pcc-Constants.Patm)/mdot*eps*pi*rt^2;
isp = Ueq/Constants.g;
end

