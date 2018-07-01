function [ xi ] = nelder( designVec )
%Nelder mead approximation method
%   Detailed explanation goes here


%setup
p=1;
X=2;
Y=2;
beta=0.5;
sigma=0.5;
stop=100;
x=designVec; %starting area
% number of points;
n=length(designVec)+1;
% starting polygon
for ii=1:n
   
   if ii==2
       x(ii-1)=x(ii-1)+3;
   elseif ii==3
       x(ii-1)=x(ii-1)+1;
   elseif ii==4
       x(ii-1)=x(ii-1)+0.5;
   elseif ii==5
       x(ii-1)=x(ii-1)+1;
   elseif ii==6
       x(ii-1)=x(ii-1)+0.5;
   end
   xi(ii,:)=x;
end


tol=1;
p=[1000 2000 4000 8000 16000];

for kk=1:length(p)
iter=0;
while iter<50
xi;
% Ordering the points
for jj=1:n
fxi(jj,:)=objPenalty(xi(jj,:),p(kk));
end
sortf=sort(fxi,'ascend');
tol=abs(sortf(1)-sortf(2));
%find the worst point
ind=find(fxi==max(fxi));
% Find the points to use in the centroid.
fx=fxi~=max(fxi);
cx=xi(fx,:);
% computing centroid
c=1/(n-1)*sum(cx);
% reflection
alpha=1;
xnew=c+alpha*(c-xi(ind,:));
fxnew=objPenalty(xnew,p(kk));
better=fxnew<=sortf;
if better(1)==1
    xexp=c+Y*(xnew-c);
    xi(ind,:)=xexp;
end
if any(better(2:end)>=1)
    xi(ind,:)=xnew;
else
    xcon=c+beta*(xi(ind,:)-c);
    xi(ind,:)=xcon;
end




iter=iter+1;
xi;
tol;



end

end














end

