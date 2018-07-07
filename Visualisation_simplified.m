
%% Visualization of simplified problem


addpath('Modelling')
addpath('OptimizationFunctions')



% Script for making a visulization of the simplified problem. 
% 
%   Run after running Optimization_script in order to plot the optimum
%   points, also this only works for the simplified problem
%% #####################################################################

dx=1;

rThroat=5:dx:80;
epsilon=2:dx:50;


% Matrix of output values for combinations of design variables rThroat and epsilon: 

for j=1:1:length(epsilon)
  for i=1:1:length(rThroat)
    % Assignment of design variables:
    designVec(1) = rThroat(i);
    designVec(2) = epsilon(j);
    designVec(3) = Constants.t;
    designVec(4) = Constants.theta1;
    designVec(5) = Constants.theta2;
 	% Objective function
    obj = thrust(designVec);
    % Grid value of objective function:
    fobj(j,i) = obj; 
     
    % Scaled constraints:
    con = constraintNormal(designVec);
    % Grid values of constraints:
    con1(j,i) = con(1);    % Scaled length constraint
    con2(j,i) = con(2);    % Scaled ISP constraint
    con3(j,i) = con(3);    % Scaled stress constraint
    con4(j,i) = con(4);    % Scaled temperature constraint
    con5(j,i) = con(5);    % Scaled mass constraint


  end
end
%% Plotting
close all
contour(rThroat, epsilon, fobj,-5:0.5:-0.5,'ShowText','on')
xlabel('Throat radius rThroat (m)'), ylabel('Area ratio epsilon (-)'), ...
%    title('Figure 1, Design space of simplified problem final project')
hold on
contour(rThroat, epsilon, con1, [0.0 0.0],'r') % Lenght constraint
contour(rThroat, epsilon, con1, [0.1 0.1],'r--') % Infeasible region


contour(rThroat, epsilon, con2, [0.0 0.0],'b') % ISP constraint
contour(rThroat, epsilon, con2, [0.1 0.1],'b--')   % Infeasible region

contour(rThroat, epsilon, con3, [0.0 0.0],'y') % Stress constraint
contour(rThroat, epsilon, con3, [0.05 0.05],'y--')   % Infeasible region

contour(rThroat, epsilon, con4,[0.0,0.0],'g') % Temperature constraint
contour(rThroat, epsilon, con4,[0.01 0.01],'g--')   % Infeasible region

contour(rThroat, epsilon, con5, [0.0 0.0],'m') % Mass constraint
contour(rThroat, epsilon, con5, [0.1 0.1],'m--')   % Infeasible region


plot(x(1),x(2),'r*')
plot(y(1),y(2),'b*')
plot(opti(1),opti(2),'g*')
plot(rgp(1),rgp(2),'m*')
legend('Objective function','Length constraint','Length constraint infeasable region','ISP constraint','ISP constraint infeasable region','Stress constraint',...
    'Stress constraint infeasable region','Mass constraint','Mass constraint infeasable region','fmincon optimum point','fminsearch optimum point','Custom Nelder-Mead optimum point','RGP optimum point')
grid
set(gca,'FontSize',12)







