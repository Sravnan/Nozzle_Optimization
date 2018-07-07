function [ xcenter,ycenter, ii] = goldenSection(F, bounds , maxiter,tol)
%Use Golden Section method to find minimum of unconstrained 1-d problem
% Inputs:
%   F           = function handle of 1-d function to minimize
%   bounds      = array containing two elements, start and end of search
%   maxiter     = maximum allowed number of iterations
%   tol         = allowed tolerance of error
% Oututs:
%   xcenter     = location of center of final bounds
%   ycenter     = function value at center of final bounds
%   ii          = number of iterations 



% Define phi
phi = (-1+sqrt(5))/2;
% Set initial inner, outer and center points
xinner = bounds(1);
xouter = bounds(2);
DeltaX = xouter-xinner;
yinner = F(xinner);
youter = F(xouter);
ii = 1; % Counter
difference = 1e4 ;
% While within max iterations or tolerance not met:
while (ii<maxiter)&&(difference>tol)
    %% Determine value at bounds and center
    xcenter = (xinner+xouter)/2;
    DeltaX = xouter-xinner;
    ycenter = F(xcenter);
    %% Interpolate to approximate minimum
    %Determine parabola through bounds and center
    y = [yinner;ycenter;youter];
    X = [xinner^2,xinner,1;
         xcenter^2,xcenter,1;
         xouter^2,xouter,1];
    A = X\y;
    if A(1)>0
        xmin = -A(2)/2/A(1);
    elseif yinner<youter
        xmin = xinner;
    else
        xmin = xouter;
    end
    
    %% Reduce interval
    if xmin > xcenter
        xinner = xouter-phi*DeltaX;
        yinner = F(xinner);
    else
        xouter = xinner+phi*DeltaX;
        youter = F(xouter);
    end
    difference = abs(youter-yinner);
    ii = ii+1;
end

end

