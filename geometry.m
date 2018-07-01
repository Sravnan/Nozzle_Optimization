function [x,y,Aratio,xe,V] = geometry(designVec)
%geometry is a function that coputes the x and y coordinates of the bell
%nozzle
% Inputs:
%   designVec
% Oututs:
%   x coordinate (m)
%   y coordinate (m)
%   Aratio area ratio (-)
%   xe exit lenght (m)

%% Check if simplified problem and convert to SI Units
if length(designVec)==2
    rt = 0.001*designVec(1);
    eps = designVec(2);
    t = 0.001*Constants.t;
    theta1 = pi/180*Constants.theta1;
    theta2 = pi/180*Constants.theta2 ;
else
    rt = 0.001*designVec(1);
    eps = designVec(2);
    t = 0.001*designVec(3);
    theta1 =pi/180*designVec(4);
    theta2 = pi/180*designVec(5);
end

%% Setting up formulas
% Length at start bell curve
xp=0.382*rt*sin(theta1);
% Radius at start bell curve
yp=rt+(1-cos(theta1))*0.382*rt;
% Exit radius
ye=sqrt(eps)*rt;
% Constants for the calculation of the contour
a=(tan(pi/2-theta2)-tan(pi/2-theta1))/(2*(ye-yp));
b=tan(pi/2-theta1)-(tan(pi/2-theta2)-tan(pi/2-theta1))...
    /(2*(ye-yp))*yp;
c=xp-a*yp^2-b*yp;
% Length at nozzle exit
xe=a*ye^2+b*ye+c;

%% Calculating x and y coordinates

dx=0.005;
xi=0:dx:xe;
y=[];
ii=1:length(xi);
for ii=ii
if xi(ii)<xp
    theta=asin(xi(ii)/(0.382*rt));
    y(ii)=rt-(cos(theta)*0.382*rt-0.382*rt);
    
else
    y(ii)=(-b+sqrt(b^2-4*a*(c-xi(ii))))/(2*a);
    %y(ii)=0.4;
end
end
y(length(xi)+1)=ye;
x=xi;
x(length(xi)+1)=xe;
%% Calculating area ratio from the points
Athroat=pi*rt^2;
Aratio=(y.^2.*pi)./Athroat;

%% Calculating Volume
V = sum(pi.*(y(1:end-1)+t).^2-y(1:end-1).^2).*dx+pi.*((y(end)+t).^2-y(end).^2).*(xe-x(end-1));



end






