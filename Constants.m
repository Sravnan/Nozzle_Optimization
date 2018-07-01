%% Constant parameters
% That are used in most of the programs to compute aspects that 
% the optimization needs. 
%% Class creation

classdef Constants
    properties(Constant=true)
        %% Environment Variables
        Tamb = 290;                                                % Ambient Temperature [K]
        Patm =12044.6;                                            % Atmospheric Pressure at sea lavel [Pa]
        g = 9.8065;                                               % Earth acceleration [m/s^2]
        %% Engine Variables
        Pcc=6e6;                                                 % Chamber pressure [Pa]
        Tcc=3500;                                                 % Chamber temperature [K]
        Mmass=13.4;                                               % Mollecular mass combustion products [g/mol]
        gamma=1.199;                                              % Spesific heat ratio [-]
        Rgass=8.3144598;                                          % Universal gass constant [J/(K*mol)]
        Rspess=Constants.Rgass*1000/Constants.Mmass;              % Spesific gass constant [J/(K*kg)]
        Cp=Constants.Rspess*(Constants.gamma/(Constants.gamma-1)) % Spesific heat constant pressure [J/(K*kg)]
        VH=0.648336914899513;                                     % Vandenkerckhove constant [-] Big Gamma
        tnoz=0.005;                                               % Thickness 
        mu= 4.14e-5;                                              % Dynamic Viscosity [Pa s]
        Tcool = 100;                                              % Temperature of Coolant at Throat [K]
        hcool = 50000;                                            % Coefficient of Convection for Coolant [W/m^2/K]
        ThrustNorm=25000;                                         % Value for normalizing the thrust.   
        %% Material Propperties [yield stress(Pa), desnity(kg/m^3), Thermal conductivity(W/(m*k)), Emmisivity(-)] @ 1500 C
        TZM=[100e6 10.2*1000 95 0.16];
        %% Simplified Problem design defaults
        t = 0.002;                                                % Default nozzle wall thickness [m]
        theta1 = 30*pi/180;                                       % Default nozzle divergence half angle [rad]
        theta2 = 4*pi/180;                                        % Default nozzle exit half angle [rad]  
        %% Nozzle convergent section
        beta = 30*pi/180;
        xconv = 0.3;
    end
end
