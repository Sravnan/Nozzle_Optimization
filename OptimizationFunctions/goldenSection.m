function [ xcenter,ycenter, ii] = goldenSection(F, bounds , maxiter,tol)
%Use Golden Section method to find minimum of unconstrained problem
phi = (-1+sqrt(5))/2;
xinner = bounds(1);
xouter = bounds(2);
DeltaX = xouter-xinner;
yinner = F(xinner);
youter = F(xouter);
ii = 1;
difference = 1e4 ;
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

