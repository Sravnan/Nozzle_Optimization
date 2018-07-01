function [ thrust ] = thrust( designVec )
%Calcuate thrust of design
% Inputs:
% designVec = vector of design elements, (1) is thetap, (2) is thetae, (3)
% is the throat diameter, (4) is the expansion ratio.
% Outputs:
%   thrust = thrust of the design [N]

%% Check if simplified problem
if length(designVec)==2
    rt = designVec(1);
    eps = designVec(2);
    t = Constants.t;
    theta1 = Constants.theta1;
    theta2 = Constants.theta2 ;
else
    rt = designVec(1);
    eps = designVec(2);
    t = designVec(3);
    theta1 =designVec(4);
    theta2 = designVec(5);
end

pepc = pressureRatioCalc(eps,0.01,1e-6);     % Pressure ratio

mdot = Constants.VH*Constants.Pcc*pi*rt^2/sqrt(Constants.Rspess*Constants.Tcc);

Uexit = sqrt(2*Constants.gamma/(Constants.gamma - 1)*Constants.Rspess*Constants.Tcc*(1 - pepc^((Constants.gamma - 1)/Constants.gamma)));

divLoss = 0.5*(1+cos((theta1+theta2)/2));

thrust = -(divLoss*mdot * Uexit + (pepc*Constants.Pcc-Constants.Patm)*eps*pi*rt^2);

end

