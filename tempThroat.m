function [ Tin, Tout] = tempThroat(designVec)
%tempThroat Calculate temperature in the nozzle throat

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
mdot = Constants.VH*Constants.Pcc*pi*designVec(3)^2/sqrt(Constants.Rspess*Constants.Tcc);

hin =1.213*0.026*mdot^0.8*Constants.mu^0.2*Constants.Cp*Pr^(-2/3)*(2*designVec(3))^(-1.8);  % Coefficient of convection to the inside of the nozzle

% Solve system of equations
syms Tsin Tsout
eq1 = hin  * (2*Tr/(Tr + Tsin))^(2/3)*(Tr - Tsin) - k/designVec(5) *(Tsin - Tsout) ==0 ;
eq2 = -hout* (Tsout - Tcool) - sigma * (Tsout^4-Tamb^4)+ k/designVec(5) *(Tsin - Tsout) ==0;
[Tin,Tout]= vpasolve([eq1,eq2],[Tsin, Tsout]);

end

