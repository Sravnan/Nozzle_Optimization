function [  ] = v_s( designVec )
%% Visualization of simplified problem
%
%
%
%
%




dx=2;

rThroat=5:dx:100;
epsilon=5:2:100;


% Matrix of output values for combinations of design variables rThroat and epsilon: 

for j=1:1:length(epsilon)
  for i=1:1:length(rThroat)
    % Assignment of design variables:
    designVec(1) = rThroat(i);
    designVec(2) = epsilon(j);
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
%     con6(j,i) = con(6);    % Scaled min angle thetha 1
%     con7(j,i) = con(7);    % Scaled min pressure thetha 1

  end
end
%%
close all
contour(rThroat, epsilon, fobj,-5:0.5:0,'ShowText','on')
xlabel('Throat radius rThroat (m)'), ylabel('Area ratio epsilon (-)'), ...
   title('Figure 1, Design space of simplified problem final project')
hold on
contour(rThroat, epsilon, con1, [0.0 0.0],'r') % Lenght constraint
contour(rThroat, epsilon, con1, [0.1 0.1],'r--') % Infeasible region

contour(rThroat, epsilon, con2, [0.0 0.0],'b') % ISP constraint
contour(rThroat, epsilon, con2, [0.1 0.1],'b--')   % Infeasible region

contour(rThroat, epsilon, con3, [0.0 0.0],'y') % Stress constraint
contour(rThroat, epsilon, con3, [0.1 0.1],'y--')   % Infeasible region

contour(rThroat, epsilon, con4,[0.0,0.0],'g') % Temperature constraint
contour(rThroat, epsilon, con4,[0.01 0.01],'g--')   % Infeasible region

contour(rThroat, epsilon, con5, [0.0 0.0],'m') % Mass constraint
contour(rThroat, epsilon, con5, [0.1 0.1],'m--')   % Infeasible region

% contour(rThroat, epsilon, con6, [0.0 0.0],'k') % theta 1 constraint
% contour(rThroat, epsilon, con6, [0.1 0.1],'k--')   % Infeasible region

% contour(rThroat, epsilon, con7, [0.0 0.0],'c') % pressure constraint
% contour(rThroat, epsilon, con7, [0.1 0.1],'c--')   % Infeasible region



grid
end






