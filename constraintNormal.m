function [ constraints, geq ] = constraintNormal( designVec )
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
maxMass=2;                      % max mass in kg
maxTheta1 = 60;
minTheta1 = 20;
maxTheta2 = 15;

%Importing values needed for the constraints
[~,~,~,xe,V]=geometry(designVec);
ISP=isp(designVec);
Stress=max(stress(designVec));
temp=tempThroatEff(designVec);
mass=V*Constants.TZM(3);
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
pRatio = pressureRatioCalc(designVec(2),0.1,1e-6);
thinwalled=t/designVec(1);
% Thrust=thrust(designVec);
% Normalizing
constraints(1)=xe/maxLength-1;      % Max length constrait
constraints(2)=1-ISP/minISP;        % Min isp constraint
constraints(3)=Stress/maxStress-1;  % Max stress constraint
constraints(4)=temp/maxTemp-1;      % Max temperature constraint
constraints(5)=mass/maxMass-1;      % Max mass constraint
constraints(6)=1-theta1/minTheta1;  % Min divergence half angle constraint
constraints(7)=theta1/maxTheta1-1;  % Max divergence half angle constraint
constraints(8)=theta2/maxTheta2-1;  % Max divergence half angle constraint

constraints(9)=10*thinwalled-1;     % Thin walled assumtion 
% constraints(10)= pRatio/(Patm/Pcc)-1; % Pressure equality constraint


% Giving empty equality constraints
geq=[];


end

