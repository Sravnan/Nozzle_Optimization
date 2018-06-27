function [ M ] = Msolve( epsinv, M0 )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

syms M
gamma = Constants.gamma;
eq1 = M*((gamma + 1)/2)^((gamma + 1)/(2*(gamma - 1)))/((1+(gamma-1)/2*M^2)^( (gamma + 1)/(2*(gamma - 1))))-epsinv ==0;
M = vpasolve(eq1,M,M0);
end

