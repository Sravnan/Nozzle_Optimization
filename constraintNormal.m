function [ constraints ] = constraintNormal( designVec )
%constraintNormal The mormalized constraint functions are calculaed here. 
%   Detailed explanation goes here
% Input:
%   designVec
% Output:
%   constraints  vector of all the constraintfunctions. 
%

%% Normalizing constraints.
Pcc = Constants.Pcc;            % Chamber pressure
Patm = Constants.Patm;          % Atmospheric Presure
maxStress=Constants.TZM(1);     % Max stress in Pa
maxTemp=1600+273;               % Max temp in K
minISP=400;                     % Minimum ISP in s
maxLength=1;                    % max length in meters
maxMass=2;                      % max mass
minThrust=30000;
maxTheta1 = 20;
%Importing values needed for the constraints
[~,~,~,xe,V]=geometry(designVec);
ISP=isp(designVec);
Stress=max(stress(designVec));
temp=tempThroatEff(designVec);
mass=V*Constants.TZM(3);
if length(designVec) ==2
    theta1 = Constants.theta1;
else
    theta1 = designVec(4);
end
% pRatio = pressureRatioCalc(designVec(2),0.1,1e-6);
% Thrust=thrust(designVec);
% Normalizing
constraints(1)=xe/maxLength-1;      % Max length constrait
constraints(2)=1-ISP/minISP;        % Min isp constraint
constraints(3)=Stress/maxStress-1;  % Max stress constraint
constraints(4)=temp/maxTemp-1;      % Max temperature constraint
constraints(5)=mass/maxMass-1;      % Max mass constraint
constraints(6)=1-theta1/maxTheta1;
% constraints(6)= pRatio/(Patm/Pcc)-1; % Pressure equality constraint







end

