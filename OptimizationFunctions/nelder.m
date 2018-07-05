function [ opti,optimum ] = nelder( designVec )
%Nelder mead approximation method
%   Detailed explanation goes here


%setup
Y=3;
beta=0.5;
alpha=1;
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
       x(ii-1)=x(ii-1)+3;
   elseif ii==6
       x(ii-1)=x(ii-1)+1;
   end
   xi(ii,:)=x;
end

p=[500 1000 2000 4000 8000 16000 32000 64000 128000 256000];

for kk=1:length(p)
iter=0;
while iter<400
% Ordering the points
for jj=1:n
fxi(jj,:)=objPenalty(xi(jj,:),p(kk));
end
sortf=sort(fxi,'ascend');
%find the worst point
ind=find(fxi==max(fxi));
% Find the points to use in the centroid.
fx=fxi~=max(fxi);
cx=xi(fx,:);
% computing centroid
c=1/(n-1)*sum(cx);
% reflection

xnew=c+alpha*(c-xi(ind(1),:));
fxnew=objPenalty(xnew,p(kk));
better=fxnew<=sortf;
if better(1)==1
    xexp=c+Y*(xnew-c);
    xi(ind(1),:)=xexp;
elseif any(better(2:end)>=1)
    xi(ind(1),:)=xnew;
else
    xcon=c+beta*(xi(ind(1),:)-c);
    xi(ind(1),:)=xcon;
end
iter=iter+1;
xi;

end
index=find(fxi==min(fxi));
optimum(kk,:)=xi(index(1),:);
end
opti=optimum(length(p),:);













end

