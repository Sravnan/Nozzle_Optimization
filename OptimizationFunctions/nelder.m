function [ opti,optimum ] = nelder( designVec )
%Nelder-Mead optimization method
% Inputs:
%   designVec   = vector of design elements,(1) throat radius ,(2)
%   expansion ratio, optional (3) thickness, optional (4) throat divergence
%   half angle, optionel (5) exit divergence half angle
% Oututs:
%   opti        = final optimum point
%   optimum     = array of intermediate optima



%setup
Y=2;        %expantion factor
beta=0.5;   %contraction factor
alpha=1;    %reflection factor
x=designVec;%starting area

% number of points;
n=length(designVec)+1;

%% starting polygon
for ii=1:n
   
   if ii==2
       x(ii-1)=x(ii-1)+3;
   elseif ii==3
       x(ii-1)=x(ii-1)+1;
       x(ii-2)=x(ii-2)+1;
   elseif ii==4
       x(ii-1)=x(ii-1)+0.5;
       x(ii-2)=x(ii-2)+0.5;
       x(ii-3)=x(ii-3)+0.5;
   elseif ii==5
       x(ii-1)=x(ii-1)+3;
       x(ii-2)=x(ii-2)+3;
       x(ii-3)=x(ii-3)+3;
       x(ii-4)=x(ii-4)+3;
   elseif ii==6
       x(ii-1)=x(ii-1)+1;
       x(ii-2)=x(ii-2)+1;
       x(ii-3)=x(ii-3)+1;
       x(ii-4)=x(ii-4)+1;
       x(ii-5)=x(ii-5)+1;
   end
   xi(ii,:)=x;
end

%% Penalization factor
z=6:16;
p=10.*2.^z;

%% Nelder-Mead algorithm
for kk=1:length(p)
    iter=0;
    % 250 iterations is more than enough to converge
    while iter<250
        % Ordering the points
        for jj=1:n
            fxi(jj,:)=objPenalty(xi(jj,:),p(kk));
        end
        sortf=sort(fxi,'ascend');
        % find the worst point
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
        % Checking if expansion can be done 
        if better(1)==1
            xexp=c+Y*(xnew-c);
            fexp=objPenalty(xexp,p(kk));
            if fexp<fxnew
                xi(ind(1),:)=xexp;
            else
                xi(ind(1),:)=xnew;
            end
        % Normal reflection
        elseif any(better(2:end)>=1)
            xi(ind(1),:)=xnew;
        % Contraction
        else
            xcon=c+beta*(xi(ind(1),:)-c);
            fcon=objPenalty(xcon,p(kk));
            if fcon<fxnew
                xi(ind(1),:)=xcon;
            % Rescaling of whole simplex(rarly happens)
            else
                ind2=find(fxi==min(fxi));
                ss=[1 2 3 4 5 6];
                ind3=ind2~=ss;
                xi(ind3,:)=xi(ind2(1),:)+0.5*(xi(ind3,:)-xi(ind2(1),:));
                disp('Rescaling')
            end
        end
    end

    % Adding one to iterations
    iter=iter+1;
end
% Finding the optimum value
index=find(fxi==min(fxi));
optimum(kk,:)=xi(index(1),:);
end
% Final optimum point
opti=optimum(length(p),:);

end

