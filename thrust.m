function [ thrust ] = thrust( designVec )
%Calcuate thrust of design
% Inputs:
% designVec = vector of design elements, (1) is thetap, (2) is thetae, (3)
% is the throat diameter, (4) is the expansion ratio.
% Outputs:
%   thrust = thrust of the design [N]

pepc = pressureRatioCalc(designVec(4),0.01,1e-6);     % Pressure ratio

mdot = Constants.VH*Constants.Pcc*pi*designVec(3)^2/sqrt(Constants.Rspess*Constants.Tcc);

Uexit = sqrt(2*Constants.gamma/(Constants.gamma - 1)*Constants.Rspess*Constants.Tcc*(1 - pepc^((Constants.gamma - 1)/Constants.gamma)));

divLoss = 0.5*(1+cos((designVec(1)+designVec(2))/2));

thrust = divLoss*mdot * Uexit + (pepc*Constants.Pcc-Constants.Patm)*sqrt(designVec(4))*pi*designVec(3)^2;

end

