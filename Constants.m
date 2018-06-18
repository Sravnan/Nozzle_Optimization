%% Constant parameters
% That are used in most of the programs to compute aspects that 
% the optimization needs.

classdef Constants
    properties(Constant=true)
        Pcc=6e6;                                                  % Chamber pressure [Pa]
        Tcc=3500;                                                 % Chamber temperature [K]
        Mmass=13.4;                                               % Mollecular mass combustion products [g/mol]
        gamma=1.199;                                              % Spesific heat ratio [-]
        Rgass=8.3144598;                                          % Universal gass constant [J/(K*mol)]
        Rspess=Constants.Rgass*1000/Constants.Mmass;              % Spesific gass constant [J/(K*kg)]
        Cp=Constants.Rspess*(Constants.gamma/(Constants.gamma-1)) % Spesific heat constant pressure [J/(K*kg)]
    end
end
