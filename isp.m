function [ isp ] = isp( designVec )
%calculate Isp

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
Uexit = sqrt(2*Constants.gamma/(Constants.gamma - 1)*Constants.Rspess*Constants.Tcc*(1 - pepc^((Constants.gamma - 1)/Constants.gamma)));
mdot = Constants.VH*Constants.Pcc*pi*rt^2/sqrt(Constants.Rspess*Constants.Tcc);

Ueq = Uexit +  (pepc*Constants.Pcc-Constants.Patm)/mdot*eps*pi*rt^2;
isp = Ueq/Constants.g;
end

