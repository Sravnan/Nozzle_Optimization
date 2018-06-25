%% Constant parameters
% That are used in most of the programs to compute aspects that 
% the optimization needs. 
%% Class creation

classdef Constants
    properties(Constant=true)
        %% Environment Variables
        Patm =1.015e5;                                            % Atmospheric Pressure at sea lavel [Pa]
        g = 9.8065;                                               % Earth acceleration [m/s^2]
        %% Engine Variables
        Pcc=20e6;                                                  % Chamber pressure [Pa]
        Tcc=3500;                                                 % Chamber temperature [K]
        Mmass=13.4;                                               % Mollecular mass combustion products [g/mol]
        gamma=1.199;                                              % Spesific heat ratio [-]
        Rgass=8.3144598;                                          % Universal gass constant [J/(K*mol)]
        Rspess=Constants.Rgass*1000/Constants.Mmass;              % Spesific gass constant [J/(K*kg)]
        Cp=Constants.Rspess*(Constants.gamma/(Constants.gamma-1)) % Spesific heat constant pressure [J/(K*kg)]
        VH=0.648336914899513;                                     % Vandenkerckhove constant [-] Big Gamma
        %% Material Propperties [yeld stress(Pa), desnity(g/cc), Thermal conductivity(W/(m*k)), Emmisivity(-)] @ 1000 C
        TZM=[650e6 10.2 110 0.14];
    end
end
