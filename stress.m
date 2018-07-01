function [ stress] = stress( designVec )
%Stress Stress calculator for each cross section 
%   Detailed explanation goes here
% Inputs:
%   designVec
%
% Outputs:
%   thickness(t) [m]
%   stress       [Pa] 
%% Check if simplified problem
if length(designVec)==2
    designVec(1) = designVec(1);
    designVec(2) = designVec(2);
    designVec(3) = Constants.t;
    designVec(4) = Constants.theta1;
    designVec(5) = Constants.theta2 ;
else
    designVec(1)= designVec(1);
    designVec(2) = designVec(2);
    designVec(3) = designVec(3);
    designVec(4) =designVec(4);
    designVec(5) = designVec(5);
end

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
stress=Pressure.*2.*y./(2.*designVec(5));

end

