function [ constraints, geq ] = constraintNormal( designVec )
%constraintNormal The mormalized constraint functions are calculaed here. 
% Input:
%   designVec   = vector of design elements,(1) throat radius ,(2)
%   expansion ratio, optional (3) thickness, optional (4) throat divergence
%   half angle, optionel (5) exit divergence half angle
% Output:
%   constraints = vector of all the constraint functions. 
%

%% Normalizing constraints.
Pcc = Constants.Pcc;            % Chamber pressure
Patm = Constants.Patm;          % Atmospheric Presure
maxStress=Constants.TZM(1);     % Max stress in Pa
maxTemp=1600+273;               % Max temp in K
minISP=400;                     % Minimum ISP in s
maxLength=1;                    % max length in meters
maxMass=2;                      % max mass in kg
maxTheta1 = 60;                 % max divergence half angle theta1 in deg
minTheta1 = 20;                 % min divergence half angle theta1 in deg
maxTheta2 = 15;                 % max divergence half angle theta2 in deg
tmin=0.1;                       % min thickness in mm
emin=4;                         % min expantion ratio
%Importing values needed for the constraints
%% Check if simplified problem
if length(designVec)==2  %
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
%% Evaluate Model at designpoint
[~,~,~,xe,V]=geometry(designVec);
ISP=isp(designVec);
Stress=max(stress(designVec));
temp=tempThroatEff(designVec);
mass=V*Constants.TZM(3);
thinwalled=t/designVec(1);

%% Normalize constraints
constraints(1)=xe/maxLength-1;      % Max length constrait
constraints(2)=1-ISP/minISP;        % Min isp constraint
constraints(3)=Stress/maxStress-1;  % Max stress constraint
constraints(4)=temp/maxTemp-1;      % Max temperature constraint
constraints(5)=mass/maxMass-1;      % Max mass constraint
constraints(6)=1-theta1/minTheta1;  % Min divergence half angle theta1 constraint
constraints(7)=theta1/maxTheta1-1;  % Max divergence half angle theta1 constraint
constraints(8)=theta2/maxTheta2-1;  % Max divergence half angle theta2 constraint
constraints(9)=10*thinwalled-1;     % Thin walled assumtion
% Addidional constraints for Nelder only activate while running Nelder
constraints(10)=1-eps/emin;
constraints(11)=1-t/tmin;

% Giving empty equality constraints for fmincon
geq=[];


end

