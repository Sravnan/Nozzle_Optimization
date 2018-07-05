close all;
clear all;
clc;

%% File to investigate linearity, convexity and monotonicity of functions
% Design vector set up:
%Set up design vectors
n = 500;% Number of elements 
rDefault = 30* ones(n,1); % Default throat radus
rup = 50;
rlow = 10;

epsDefault =  15* ones(n,1);% Default expansion ratio
epsup = 40;
epslow = 5;

tDefault = 2* ones(n,1); % Default thickness
tup = 10;
tlow = 0.5;

theta1Default = 30 * ones(n,1);% Default angle 1
theta1up = 50 ;
theta1low = 10 ;
theta2Default =  4 * ones(n,1);% Default angle 2
theta2up = 20 ;
theta2low = 2 ;
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

values1 = zeros(n,10);
values2 = zeros(n,10);
values3 = zeros(n,10);
values4 = zeros(n,10);
values5 = zeros(n,10);

%Calculate responses
for ii = 1:n
    values1(ii,:) = [thrust(designVec1(ii,:)),constraintNormal(designVec1(ii,:))];
    values2(ii,:) = [thrust(designVec2(ii,:)),constraintNormal(designVec2(ii,:))];
    values3(ii,:) = [thrust(designVec3(ii,:)),constraintNormal(designVec3(ii,:))];
    values4(ii,:) = [thrust(designVec4(ii,:)),constraintNormal(designVec4(ii,:))];
    values5(ii,:) = [thrust(designVec5(ii,:)),constraintNormal(designVec5(ii,:))];
end
%% Plotting
close all;
fontsize = 12;
linewidth = 1.5;
set(0, 'DefaultLineLineWidth', linewidth);
% Derivatives of r
figure
title('Thrust as a function of r')
plot(rVaried, values1(:,1))
xlabel('Throat radius [cm]')
ylabel('Thrust Objective function value')
set(gca, 'FontSize',fontsize)


figure
% title('Constraints as a function of r')
hold on
plot(rVaried, values1(:,2),'k')
plot(rVaried, values1(:,3),'r')
plot(rVaried, values1(:,4),'g')
plot(rVaried, values1(:,5),'b')
plot(rVaried, values1(:,6),'m')
xlabel('Throat radius [cm]')
ylabel('Normalized constraint values')
legend('Length Constraint','Specific Impulse Constraint','Stress Constraint', 'Temperature Constraint','Mass Constraint','Location','Best')
set(gca, 'FontSize',fontsize)


% Derivatives of eps

figure
% title('Thrust as a function of eps')

plot(epsVaried, values2(:,1))
xlabel('Expansion ratio [-]')
ylabel('Thrust Objective function value')
set(gca, 'FontSize',fontsize)

figure
% title('Constraints as a function of Eps')

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
% title('Thrust as a function of t')
plot(tVaried, values3(:,1))
xlabel('Wall thickness [mm]')
ylabel('Thrust Objective function value')
set(gca, 'FontSize',fontsize)

figure
% title('Constraints as a function of t')
hold on
plot(tVaried, values3(:,2),'k')
plot(tVaried, values3(:,3),'r')
plot(tVaried, values3(:,4),'g')
plot(tVaried, values3(:,5),'b')
plot(tVaried, values3(:,6),'m')
xlabel('Wall thickness [mm]')
ylabel('Normalized constraint values')
legend('Length Constraint','Specific Impulse Constraint','Stress Constraint', 'Temperature Constraint','Mass Constraint','Location','Best')
set(gca, 'FontSize',fontsize)

% Derivatives of theta1

figure
% title('Thrust as a function of \theta 1')
plot(theta1Varied, values4(:,1))
xlabel('Throat divergence half angle \theta 1 [deg]')
ylabel('Thrust Objective function value')
set(gca, 'FontSize',fontsize)

figure
% title('Constraints as a function of \theta 1')
hold on
plot(theta1Varied, values4(:,2),'k')
plot(theta1Varied, values4(:,3),'r')
plot(theta1Varied, values4(:,4),'g')
plot(theta1Varied, values4(:,5),'b')
plot(theta1Varied, values4(:,6),'m')
xlabel('Throat divergence half angle \theta 1 [deg]')
ylabel('Normalized constraint values')
legend('Length Constraint','Specific Impulse Constraint','Stress Constraint', 'Temperature Constraint','Mass Constraint','Location','Best')
set(gca, 'FontSize',fontsize)


% Derivatives of theta2
figure
% title('Thrust as a function of \theta 2')
plot(theta2Varied, values5(:,1))
xlabel('Exit divergence half angle \theta 2 [deg]')
ylabel('Thrust Objective function value')
set(gca, 'FontSize',fontsize)
figure
% title('Constraints as a function of \theta 2')
hold on
plot(theta2Varied, values5(:,2),'k')
plot(theta2Varied, values5(:,3),'r')
plot(theta2Varied, values5(:,4),'g')
plot(theta2Varied, values5(:,5),'b')
plot(theta2Varied, values5(:,6),'m')
xlabel('Exit divergence half angle \theta 2 [deg]')
ylabel('Normalized constraint values')
legend('Length Constraint','Specific Impulse Constraint','Stress Constraint', 'Temperature Constraint','Mass Constraint','Location','Best')
set(gca, 'FontSize',fontsize)
