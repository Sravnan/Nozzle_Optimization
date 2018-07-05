function [ xmin,ymin,iter ] = lineSearch( F, searchVec, start, bounds ,maxiter,tol)
%Search function in a line for local minimum. 

%Make function of alpha
lsearch = @(alpha) F(start+alpha*searchVec);
%Use goldensection to find minimum along line
[alphamin,ymin,iter] = goldenSection(lsearch,bounds,maxiter,tol);

xmin = start+alphamin*searchVec;
end