function [ minPressureRatio] = chokedflow( designVec )
%Determine if flow through nozzle is choked
%% Check if simplified problem
if length(designVec)==2
    rt = designVec(1);
    eps = designVec(2);
    t = Constants.t;
    theta1 = Constants.theta1;
    theta2 = Constants.theta2 ;
else
    rt = designVec(1);
    eps = designVec(2);
    t = designVec(3);
    theta1 =designVec(4);
    theta2 = designVec(5);
end

gamma = Constants.gamma;
Meb = Msolve(1/eps,2);
Mebehind = (1+(gamma-1)/2*Meb^2)/(gamma*Meb^2-(gamma-1)/2);
minPressureRatio =  eps*((gamma+1)/2)^((gamma + 1)/2/(gamma-1))*Mebehind*sqrt(1 + (gamma-1)/2*Mebehind^2);

end

