function [ Tin, Tout] = tempThroatEff(designVec)
%tempThroat Calculate temperature in the nozzle throat
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
%Calculate heat flow coefficients
Pr  = 4*Constants.gamma/(9*Constants.gamma-5);% Prandtl number
kgas = Constants.mu*Constants.Cp/Pr;
r = Pr^(1/3); % recovery factor for turbulent boundary layer
hout = Constants.hcool; % Coefficient of convection to the outside of the nozzle Guesstimate
k = Constants.TZM(3); % Thermal conductivity
sigma =5.67e-8; %Boltzmann constant
ew = Constants.TZM(4);
Tcool = Constants.Tcool;% Temperature of coolant 
Tamb = Constants.Tamb; % Ambient temperature
%Solve for Temperatures
To = 2/(Constants.gamma+1)*Constants.Tcc;
Tr = To*(1+r*(Constants.gamma-1)/2);
mdot = Constants.VH*Constants.Pcc*pi*rt^2/sqrt(Constants.Rspess*Constants.Tcc);

hin =1.213*0.026*mdot^0.8*Constants.mu^0.2*Constants.Cp*Pr^(-2/3)*(2*rt)^(-1.8);  % Coefficient of convection to the inside of the nozzle

% Solve system of equations

[Tin,Tout]= Tsolve(1600,1000,hin,hout,Tcool,Tr,Tamb,sigma,k,t);





end

