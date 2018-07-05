function [ f ] = objPenalty( designVec,p )
%objPenalty Computes the objective function pluss the penalty
%   
%   Inputs:
%       designVec
%       penalization factor
%
%   Outputs:
%       function value plus penalization factor

g=constraintNormal(designVec);
for ii=1:length(g)
        % Extra penalization on expantion ratio constraint so that the 
        % model does not go to far from the constraint and not break the
        % model
    if ii==10
        penx(ii)=10*max(0,g(ii));
        % Extra penalization on ISP constraint so that the model does 
        % not go to far from the constraint
    elseif ii==2
        penx(ii)=10*max(0,g(ii));
    else
        penx(ii)=max(0,g(ii));
    end
end
% Suming up all the penalizations. 
penp=sum(penx);
pen=penp^2*p;
f=thrust(designVec)+pen;

end

