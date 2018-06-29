function [ stress] = stress( designVec )
%Stress Stress calculator for each cross section 
%   Detailed explanation goes here
% Inputs:
%   designVec
%
% Outputs:
%   thickness(t) [m]
%   stress       [Pa] 

%% Stress calculation
sf=1.5; %safety factor
maxStress=Constants.TZM(1)/sf; %Max stress of titanium
[~,y,Aratio]=geometry(designVec);
tol=0.01;
pepc0=0;
Pressure=[];
for ii=1:length(Aratio)
   Pressure(ii)=pressureRatioCalc( Aratio(ii),pepc0,tol )*Constants.Pcc; 
end
stress=Pressure.*2.*y.^2./(2.*designVec(5));

end

