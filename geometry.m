function [x,y,Aratio,xe] = geometry(designVec)
%geometry is a function that coputes the x and y coordinates of the bell
%nozzle
% Inputs:
%   designVec
% Oututs:
%   x coordinate (m)
%   y coordinate (m)
%   Aratio area ratio (-)
%   xe exit lenght (m)

%% Setting up formulas
% Length at start bell curve
xp=0.382*designVec(3)*sin(designVec(1));
% Radius at start bell curve
yp=designVec(3)+(1-cos(designVec(1)))*0.382*designVec(3);
% Exit radius
ye=sqrt(designVec(4))*designVec(3);
% Constants for the calculation of the contour
a=(tan(pi/2-designVec(2))-tan(pi/2-designVec(1)))/(2*(ye-yp));
b=tan(pi/2-designVec(1))-(tan(pi/2-designVec(2))-tan(pi/2-designVec(1)))...
    /(2*(ye-yp))*yp;
c=xp-a*yp^2-b*yp;
% Length at nozzle exit
xe=a*ye^2+b*ye+c;

%% Calculating x and y coordinates
syms y;
dx=0.005;
xi=0:dx:xe;
y=[];
ii=1:length(xi);
for ii=ii
if xi(ii)<xp
    theta=asin(xi(ii)/(0.382*designVec(3)));
    y(ii)=designVec(3)-(cos(theta)*0.382*designVec(3)-0.382*designVec(3));
    
else
    y(ii)=(-b+sqrt(b^2-4*a*(c-xi(ii))))/(2*a);
    %y(ii)=0.4;
end
end
y(length(xi)+1)=ye;
x=xi;
x(length(xi)+1)=xe;
%% Calculating area ratio from the points
Athroat=pi*designVec(3)^2;
Aratio=(y.^2.*pi)./Athroat;



end






