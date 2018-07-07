function [ stress] = stress( designVec )
%Stress Stress calculator for each cross section 
% Inputs:
%   designVec   = vector of design elements,(1) throat radius ,(2)
%   expansion ratio, optional (3) thickness, optional (4) throat divergence
%   half angle, optionel (5) exit divergence half angle
% Oututs:
%   stress      = array of local hoop stress (Pa)


%% Check if simplified problem and convert to SI Units
if length(designVec)==2
    rt = 0.001*designVec(1);
    eps = designVec(2);
    t = 0.001*Constants.t;
    theta1 = pi/180*Constants.theta1;
    theta2 = pi/180*Constants.theta2 ;
else
    rt = 0.001*designVec(1);
    eps = designVec(2);
    t = 0.001*designVec(3);
    theta1 =pi/180*designVec(4);
    theta2 = pi/180*designVec(5);
end

%% Stress calculation
sf=1.5; %safety factor
maxStress=Constants.TZM(1)/sf; %Max stress of titanium
[~,y,Aratio]=geometry(designVec);
tol=0.01;
pepc0=0;
Pressure=zeros(1,length(Aratio));
for ii=1:length(Aratio)
   Pressure(ii)=pressureRatioCalc( Aratio(ii),pepc0,tol )*Constants.Pcc; 
end
stress=Pressure.*2.*y./(2.*t);

end

