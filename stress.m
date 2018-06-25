function [ t,stress,maxStress,x,y,Aratio,Pressure] = stress( designVec )
%Stress calculator for each cross section 
%   Detailed explanation goes here
% Inputs:
%   designVec
%
% Outputs:
%   thickness(t) [m]
%   stress       [Pa] 

%% Stress calculation
sf=1.2; %safety factor
maxStress=Constants.tit(1)/sf; %Max stress of titanium
[x,y,Aratio]=geometry(designVec);
tol=0.01;
pepc0=0;
Pressure=[];
for ii=1:length(Aratio)
   Pressure(ii)=pressureRatioCalc( Aratio(ii),pepc0,tol )*Constants.Pcc; 
end
t=Pressure.*2.*y./(2.*maxStress);
stress=Pressure.*2.*y.^2./(2.*t);

end

