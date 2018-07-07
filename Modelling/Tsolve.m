function [ Tin,Tout,h ] = Tsolve( Tin0,Tout0,hin,hout,Tcool,Tr,Tamb,sigma,k,t)
% Use Newton iteration to solve the set of non-linear heat equations
% Inputs:
%   Tin0        = Initial guess for innter Temperature (K)
%   Tout0       = Initial guess for outer Temperature (K)
%   hin         = Partial coefficient of convection for inner flow (W/m^2)
%   hout        = Coefficient of convection for coolant flow (W/m^2)
%   Tcool       = Coolant temperature (K)
%   Tr          = Adiabatic wall temperature (K)
%   Tamb        = Ambient temperature (K)
%   sigma       = Stefan-Boltzmann Constant (W/m^2/K^4)
%   k           = coefficient of conduction  (W/m)
%   t           = wall thickness (m)
% Oututs:
%   Tin         = Inner Temperature (K)
%   Tout        = Outer Temperature (K)

% Assign initial guess
Tsin = Tin0;
Tsout = Tout0;
% Setup 
tol = 0.1;
delta = 1;
% dT for evaluating derivatives
dT = 0.001;
% Set up functions for evaluations
eq1 =@(Tin,Tout)real( hin  * (2*Tr/(Tr + Tin))^(2/3)*(Tr - Tin) - k/t *(Tin - Tout)) ;
eq2 =@(Tin,Tout)real( -hout* (Tout - Tcool) - sigma * (Tout^4-Tamb^4)+ k/t *(Tin - Tout)) ;
    
while delta > tol
    % Evaluate equations
    h = [eq1(Tsin,Tsout);eq2(Tsin,Tsout)];
    % Determine gradients of equaitons
    deq1dTin = (eq1(Tsin+dT,Tsout)-h(1))/dT;
    deq2dTin = (eq2(Tsin+dT,Tsout)-h(2))/dT;
    deq1dTout = (eq1(Tsin,Tsout+dT)-h(1))/dT;
    deq2dTout =(eq2(Tsin,Tsout+dT)-h(2))/dT;
    deqdT = [deq1dTin,deq2dTin;
             deq1dTout,deq2dTout];
    % use Newton iterations to find 0
    ck = -inv(deqdT'*deqdT)*h;
    deltaT = deqdT*ck;  
    delta = norm(deltaT);
    Tsin = Tsin+ deltaT(1);
    Tsout= Tsout + deltaT(2);
end
Tin = Tsin;
Tout = Tsout;

end

