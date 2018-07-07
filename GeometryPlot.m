close all;
clear all;
clc;
addpath('Modelling')
addpath('OptimizationFunctions')
%% Plot different Nozzle Results
desnelder = [59.6277; 10.1317 ; 2.4512;48.4057 ;9.2783];
dessearch =[69.9254 ; 10.2817 ; 2.0732;57.8163 ;14.9917]; 
descon = [35.3640 ; 15.3782 ; 2.0223;29.9089 ;3.9424];
desrgp =[39.7278 ;10.2945 ; 1.1771;20.0178 ;2.8409] ;
[xnelder,ynelder] = geometry(desnelder);
[xsearch,ysearch] = geometry(dessearch);
[xcon,ycon] = geometry(descon) ;
[xrgp,yrgp] = geometry(desrgp);

figure
plot(xnelder,ynelder,'y', 'Linewidth', desnelder(3))
hold on
plot(xsearch,ysearch,'r', 'Linewidth', dessearch(3))
plot(xrgp,yrgp,'g', 'Linewidth', desrgp(3))
plot(xcon,ycon,'b', 'Linewidth', descon(3))
axis equal
xlabel('x [m]')
ylabel('Nozzle Radius [m]')
plot(xnelder,-ynelder,'y')
hold on
plot(xsearch,-ysearch,'r')
plot(xrgp,-yrgp,'g')
plot(xcon,-ycon,'b')
legend('Custom Nelder-Mead','Matlab Nelder-Mead', 'Custom RGP','Matlab fmincon','Location','best')
