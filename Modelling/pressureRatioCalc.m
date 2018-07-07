function [ pepc] = pressureRatioCalc( eps,pepc0,tol )
% Calculates pressure ratio
% Inputs:
%   eps         = expansion ratio
%   pepc0       = initial guess for pressure ratio
%   tol         = tolerance
% Outputs
%   pepc        = pressure ratio 

% Iteratively solve for the pressure ratio
pepc = pepc0;
difference = 1;
while difference>tol
    pepc2gam = Constants.VH^2/(eps^2 * 2 * Constants.gamma/(Constants.gamma - 1)*(1-pepc^((Constants.gamma - 1)/Constants.gamma)));
    pepcnew = pepc2gam^(Constants.gamma/2);
    difference = abs(pepcnew-pepc);
    pepc = pepcnew;
end
pepc = real(pepc); % To avoid issues with complex solutions, take real part
end

