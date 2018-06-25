function [ constraints ] = constraintNormal( designVec )
%constraintNormal The mormalized constraint functions are calculaed here. 
%   Detailed explanation goes here
% Input:
%   designVec
% Output:
%   constraints  vector of all the constraintfunctions. 
%

%% Normalizing constraints.
maxStress=Constants.TZM(1);     % Max stress in Pa
maxTemp=1600+273;               % Max temp in K
minISP=250;                     % Minimum ISP in s
maxLength=1;                    % max length in meters
maxMass=30;                     % max mass

%Importing values needed for the constraints
[~,~,~,xe,v]=geometry(designVec);
ISP=isp(designVec);
Stress=max(stress(designVec,Constants.tnoz));
temp=tempThroat(designVec);

% Normalizing
constraints(1)=xe/maxLength-1;      % Max length constrait
constraints(2)=1-ISP/minISP;        % Min isp constraint
constraints(3)=Stress/maxStress-1;  % Max stress constraint
constraints(4)=temp/maxTemp-1;      % Max temperature constraint








end

