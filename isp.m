function [ isp ] = isp( designVec )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
pepc = pressureRatioCalc(designVec(4),0.01,1e-6);     % Pressure ratio
Uexit = sqrt(2*Constants.gamma/(Constants.gamma - 1)*Constants.Rspess*Constants.Tcc*(1 - pepc^((Constants.gamma - 1)/Constants.gamma)));
isp = Uexit/Constants.g;
end

