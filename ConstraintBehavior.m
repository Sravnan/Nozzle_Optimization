close all;
clear all;
clc;

%% File to investigate linearity, convexity and monotonicity of functions
% Design vector set up:
%Set up design vectors
n = 200;% Number of elements 
rDefault = 0.02* ones(n,1); % Default throat radus
rup = 0.1;
rlow = 0.005;

epsDefault =  20* ones(n,1);% Default expansion ratio
epsup = 40;
epslow = 10;

tDefault = 0.002* ones(n,1); % Default thickness
tup = 0.01;
tlow = 0.0005;

theta1Default = 30*pi/180 * ones(n,1);% Default angle 1
theta1up = 50*pi/180 ;
theta1low = 10*pi/180 ;
theta2Default =  4*pi/180 * ones(n,1);% Default angle 2
theta2up = 10*pi/180 ;
theta2low = 1*pi/180 ;
%% Varied vectors
rVaried = linspace(rlow,rup,n)';
epsVaried = linspace(epslow,epsup,n)';
tVaried = linspace(tlow,tup,n)';
theta1Varied = linspace(theta1low,theta1up,n)';
theta2Varied = linspace(theta2low,theta2up,n)';

designVec1 = [rVaried,epsDefault,tDefault,theta1Default,theta2Default];
designVec2 = [rDefault,epsVaried,tDefault,theta1Default,theta2Default];
designVec3 = [rDefault,epsDefault,tVaried,theta1Default,theta2Default];
designVec4 = [rDefault,epsDefault,tDefault,theta1Varied,theta2Default];
designVec5 = [rDefault,epsDefault,tDefault,theta1Default,theta2Varied];
%% Set up constraint vectors
values1 = zeros(n,6);
values2 = zeros(n,6);
values3 = zeros(n,6);
values4 = zeros(n,6);
values5 = zeros(n,6);

%Calculate responses
for ii = 1:n
    values1(ii,:) = [thrust(designVec1(ii,:)),constraintNormal(designVec1(ii,:))];
    values2(ii,:) = [thrust(designVec2(ii,:)),constraintNormal(designVec2(ii,:))];
    values3(ii,:) = [thrust(designVec3(ii,:)),constraintNormal(designVec3(ii,:))];
    values4(ii,:) = [thrust(designVec4(ii,:)),constraintNormal(designVec4(ii,:))];
    values5(ii,:) = [thrust(designVec5(ii,:)),constraintNormal(designVec5(ii,:))];
end
%% Plotting
fontsize = 12;
% Derivatives of r
figure
title('Thrust as a function of r')
plot(rVaried*100, values1(:,1)/1000)
xlabel('Throat radius [cm]')
ylabel('Thrust [kN]')
set(gca, 'FontSize',fontsize)


figure
title('Constraints as a function of r')
hold on
plot(rVaried*100, values1(:,2),'k')
plot(rVaried*100, values1(:,3),'r')
plot(rVaried*100, values1(:,4),'g')
plot(rVaried*100, values1(:,5),'b')
plot(rVaried*100, values1(:,6),'m')
xlabel('Throat radius [cm]')
ylabel('Normalized constraint values')
legend('Length Constraint','Specific Impulse Constraint','Stress Constraint', 'Temperature Constraint','Mass Constraint','Location','Best')
set(gca, 'FontSize',fontsize)


% Derivatives of eps

figure
title('Thrust as a function of eps')

plot(epsVaried, values2(:,1)/1000)
xlabel('Expansion ratio [-]')
ylabel('Thrust [kN]')
set(gca, 'FontSize',fontsize)

figure
title('Constraints as a function of Eps')

hold on
plot(epsVaried, values2(:,2),'k')
plot(epsVaried, values2(:,3),'r')
plot(epsVaried, values2(:,4),'g')
plot(epsVaried, values2(:,5),'b')
plot(epsVaried, values2(:,6),'m')
xlabel('Expansion ratio [-]')
ylabel('Normalized constraint values')
legend('Length Constraint','Specific Impulse Constraint','Stress Constraint', 'Temperature Constraint','Mass Constraint','Location','Best')
set(gca, 'FontSize',fontsize)

% Derivatives of t

figure
title('Thrust as a function of t')
plot(tVaried*1000, values3(:,1)/1000)
xlabel('Wall thickness [mm]')
ylabel('Thrust [kN]')
set(gca, 'FontSize',fontsize)

figure
title('Constraints as a function of t')
hold on
plot(tVaried*1000, values3(:,2),'k')
plot(tVaried*1000, values3(:,3),'r')
plot(tVaried*1000, values3(:,4),'g')
plot(tVaried*1000, values3(:,5),'b')
plot(tVaried*1000, values3(:,6),'m')
xlabel('Wall thickness [mm]')
ylabel('Normalized constraint values')
legend('Length Constraint','Specific Impulse Constraint','Stress Constraint', 'Temperature Constraint','Mass Constraint','Location','Best')
set(gca, 'FontSize',fontsize)

% Derivatives of theta1

figure
title('Thrust as a function of \theta 1')
plot(theta1Varied*180/pi, values4(:,1)/1000)
xlabel('Throat divergence half angle \theta 1 [deg]')
ylabel('Thrust [kN]')
set(gca, 'FontSize',fontsize)

figure
title('Constraints as a function of \theta 1')
hold on
plot(theta1Varied*180/pi, values4(:,2),'k')
plot(theta1Varied*180/pi, values4(:,3),'r')
plot(theta1Varied*180/pi, values4(:,4),'g')
plot(theta1Varied*180/pi, values4(:,5),'b')
plot(theta1Varied*180/pi, values4(:,6),'m')
xlabel('Throat divergence half angle \theta 1 [deg]')
ylabel('Normalized constraint values')
legend('Length Constraint','Specific Impulse Constraint','Stress Constraint', 'Temperature Constraint','Mass Constraint','Location','Best')
set(gca, 'FontSize',fontsize)


% Derivatives of theta2
figure
title('Thrust as a function of \theta 2')
plot(theta2Varied*180/pi, values5(:,1)/1000)
xlabel('Exit divergence half angle \theta 2 [deg]')
ylabel('Thrust [kN]')
set(gca, 'FontSize',fontsize)

figure
title('Constraints as a function of \theta 2')
hold on
plot(theta2Varied*180/pi, values5(:,2),'k')
plot(theta2Varied*180/pi, values5(:,3),'r')
plot(theta2Varied*180/pi, values5(:,4),'g')
plot(theta2Varied*180/pi, values5(:,5),'b')
plot(theta2Varied*180/pi, values5(:,6),'m')
xlabel('Exit divergence half angle \theta 2 [deg]')
ylabel('Normalized constraint values')
legend('Length Constraint','Specific Impulse Constraint','Stress Constraint', 'Temperature Constraint','Mass Constraint','Location','Best')
set(gca, 'FontSize',fontsize)
