function [ xmin,ymin,iter ] = lineSearch( F, searchVec, start, bounds ,maxiter,tol)
%Search function in a line for local minimum. 
%Use Golden Section method to find minimum of unconstrained 1-d problem
% Inputs:
%   F           = function handle of function to minimize along line
%   searchVec   = direction vector in which to search
%   start       = start vector from which to start search
%   bounds      = array containing two elements, start and end of search
%   maxiter     = maximum allowed number of iterations
%   tol         = allowed tolerance of error
% Oututs:
%   xmin        = location of linesearch minimum
%   ymin        = function value minimum
%   iter        = number of iterations 
%Make function of alpha
lsearch = @(alpha) F(start+alpha*searchVec);
%Use goldensection to find minimum along line
[alphamin,ymin,iter] = goldenSection(lsearch,bounds,maxiter,tol);
% Determine location of minimum in design space
xmin = start+alphamin*searchVec;
end