function [ f ] = objPenalty( designVec,p )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

g=constraintNormal(designVec);
for ii=1:length(g)
    penx(ii)=max(0,g(ii));
end
penp=sum(penx);
pen=penp^2*p;
f=thrust(designVec)+pen;

end

