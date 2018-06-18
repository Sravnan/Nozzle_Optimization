function [ pepc] = pressureRatioCalc( eps,pepc0,tol )
% Calculates pressure ratio
% Inputs:
%   eps  = expansion ratio
%   pepc0= initial guess for pressure ratio
%   tol  = tolerance
% Outputs
%   pepc = pressure ratio 


pepc = pepc0;
difference = 1;
while difference>tol
    pepcnew = Constants.VH^2/(eps^2 * 2 * Constants.gamma/(Constants.gamma - 1)*(1-pepc^((Constants.gamma - 1)/Constants.gamma)));
    difference = abs(pepcnew-pepc);
    pepc = pepcnew;
end

end

