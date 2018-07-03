function constraintCheck(designVec)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
x = designVec;
hxi = logspace(-20,0,100); % vector of finite difference steps
for i=1:1:length(hxi)

  % Finite diffence step
  hx = hxi(i);

% Design point for which gradients are computed 


% Forward finite diffence gradients of objective function and constraints
fx = thrust(x);
gx = constraintNormal(x);
dgdx=zeros(length(x),length(gx));
dfdx=zeros(length(x),1);
for ii=1:length(x)
  xi=x;
  xi(ii)=x(ii)+hx;
  fxplush=thrust(xi);
  dfdx(ii)=(fxplush-fx)/hx;
  gxplush=constraintNormal(xi);
  dgdx(ii,:)=(gxplush-gx)/hx;
end


Df(:,i)=dfdx;
Dg1(:,i)=dgdx(:,1);
Dg2(:,i)=dgdx(:,2);
Dg3(:,i)=dgdx(:,3);
Dg4(:,i)=dgdx(:,4);
Dg5(:,i)=dgdx(:,5);
Dg6(:,i)=dgdx(:,6);
Dg7(:,i)=dgdx(:,7);
Dg8(:,i)=dgdx(:,8);
Dg9(:,i)=dgdx(:,9);


end
%%
figure
subplot(231)
semilogx(hxi,Df(1,:))
xlabel('Difference step hx'), ylabel('Df/dx1'), title('Objective function') 
subplot(232)
semilogx(hxi,Df(2,:))
xlabel('Difference step hx'), ylabel('Df/dx2'), title('Objective function') 
subplot(233)
semilogx(hxi,Df(3,:))
xlabel('Difference step hx'), ylabel('Df/dx3'), title('Objective function') 
subplot(234)
semilogx(hxi,Df(4,:))
xlabel('Difference step hx'), ylabel('Df/dx4'), title('Objective function') 
subplot(235)
semilogx(hxi,Df(5,:))
xlabel('Difference step hx'), ylabel('Df/dx5'), title('Objective function') 


figure
subplot(231)
semilogx(hxi,Dg1(1,:))
xlabel('Difference step hx'), ylabel('dg1/dx1'), title('Length constraint') 
subplot(232)
semilogx(hxi,Dg1(2,:))
xlabel('Difference step hx'), ylabel('dg1/dx2'), title('Length constraint') 
subplot(233)
semilogx(hxi,Dg1(3,:))
xlabel('Difference step hx'), ylabel('dg1/dx3'), title('Length constraint') 
subplot(234)
semilogx(hxi,Dg1(4,:))
xlabel('Difference step hx'), ylabel('dg1/dx4'), title('Length constraint') 
subplot(235)
semilogx(hxi,Dg1(5,:))
xlabel('Difference step hx'), ylabel('dg1/dx5'), title('Length constraint') 

figure
subplot(231)
semilogx(hxi,Dg2(1,:))
xlabel('Difference step hx'), ylabel('dg1/dx1'), title('ISP constraint') 
subplot(232)
semilogx(hxi,Dg2(2,:))
xlabel('Difference step hx'), ylabel('dg1/dx2'), title('ISP constraint') 
subplot(233)
semilogx(hxi,Dg2(3,:))
xlabel('Difference step hx'), ylabel('dg1/dx3'), title('ISP constraint') 
subplot(234)
semilogx(hxi,Dg2(4,:))
xlabel('Difference step hx'), ylabel('dg1/dx4'), title('ISP constraint') 
subplot(235)
semilogx(hxi,Dg2(5,:))
xlabel('Difference step hx'), ylabel('dg1/dx5'), title('ISP constraint') 

figure
subplot(231)
semilogx(hxi,Dg3(1,:))
xlabel('Difference step hx'), ylabel('dg1/dx1'), title('Stress constraint') 
subplot(232)
semilogx(hxi,Dg3(2,:))
xlabel('Difference step hx'), ylabel('dg1/dx2'), title('Stress constraint') 
subplot(233)
semilogx(hxi,Dg3(3,:))
xlabel('Difference step hx'), ylabel('dg1/dx3'), title('Stress constraint') 
subplot(234)
semilogx(hxi,Dg3(4,:))
xlabel('Difference step hx'), ylabel('dg1/dx4'), title('Stress constraint') 
subplot(235)
semilogx(hxi,Dg3(5,:))
xlabel('Difference step hx'), ylabel('dg1/dx5'), title('Stress constraint') 

figure
subplot(231)
semilogx(hxi,Dg4(1,:))
xlabel('Difference step hx'), ylabel('dg1/dx1'), title('Temperature constraint') 
subplot(232)
semilogx(hxi,Dg4(2,:))
xlabel('Difference step hx'), ylabel('dg1/dx2'), title('Temperature constraint') 
subplot(233)
semilogx(hxi,Dg4(3,:))
xlabel('Difference step hx'), ylabel('dg1/dx3'), title('Temperature constraint') 
subplot(234)
semilogx(hxi,Dg4(4,:))
xlabel('Difference step hx'), ylabel('dg1/dx4'), title('Temperature constraint') 
subplot(235)
semilogx(hxi,Dg4(5,:))
xlabel('Difference step hx'), ylabel('dg1/dx5'), title('Temperature constraint') 

figure
subplot(231)
semilogx(hxi,Dg5(1,:))
xlabel('Difference step hx'), ylabel('dg1/dx1'), title('Mass constraint') 
subplot(232)
semilogx(hxi,Dg5(2,:))
xlabel('Difference step hx'), ylabel('dg1/dx2'), title('Mass constraint') 
subplot(233)
semilogx(hxi,Dg5(3,:))
xlabel('Difference step hx'), ylabel('dg1/dx3'), title('Mass constraint') 
subplot(234)
semilogx(hxi,Dg5(4,:))
xlabel('Difference step hx'), ylabel('dg1/dx4'), title('Mass constraint') 
subplot(235)
semilogx(hxi,Dg5(5,:))
xlabel('Difference step hx'), ylabel('dg1/dx5'), title('Mass constraint') 

figure
subplot(231)
semilogx(hxi,Dg6(1,:))
xlabel('Difference step hx'), ylabel('dg1/dx1'), title('Theta1 min constraint') 
subplot(232)
semilogx(hxi,Dg6(2,:))
xlabel('Difference step hx'), ylabel('dg1/dx2'), title('Theta1 min constraint') 
subplot(233)
semilogx(hxi,Dg6(3,:))
xlabel('Difference step hx'), ylabel('dg1/dx3'), title('Theta1 min constraint') 
subplot(234)
semilogx(hxi,Dg6(4,:))
xlabel('Difference step hx'), ylabel('dg1/dx4'), title('Theta1 min constraint') 
subplot(235)
semilogx(hxi,Dg6(5,:))
xlabel('Difference step hx'), ylabel('dg1/dx5'), title('Theta1 min constraint') 

figure
subplot(231)
semilogx(hxi,Dg7(1,:))
xlabel('Difference step hx'), ylabel('dg1/dx1'), title('Theta1 max constraint') 
subplot(232)
semilogx(hxi,Dg7(2,:))
xlabel('Difference step hx'), ylabel('dg1/dx2'), title('Theta1 max constraint') 
subplot(233)
semilogx(hxi,Dg7(3,:))
xlabel('Difference step hx'), ylabel('dg1/dx3'), title('Theta1 max constraint') 
subplot(234)
semilogx(hxi,Dg7(4,:))
xlabel('Difference step hx'), ylabel('dg1/dx4'), title('Theta1 max constraint') 
subplot(235)
semilogx(hxi,Dg7(5,:))
xlabel('Difference step hx'), ylabel('dg1/dx5'), title('Theta1 max constraint') 

figure
subplot(231)
semilogx(hxi,Dg8(1,:))
xlabel('Difference step hx'), ylabel('dg1/dx1'), title('Theta2 max constraint') 
subplot(232)
semilogx(hxi,Dg8(2,:))
xlabel('Difference step hx'), ylabel('dg1/dx2'), title('Theta2 max constraint') 
subplot(233)
semilogx(hxi,Dg8(3,:))
xlabel('Difference step hx'), ylabel('dg1/dx3'), title('Theta2 max constraint') 
subplot(234)
semilogx(hxi,Dg8(4,:))
xlabel('Difference step hx'), ylabel('dg1/dx4'), title('Theta2 max constraint') 
subplot(235)
semilogx(hxi,Dg8(5,:))
xlabel('Difference step hx'), ylabel('dg1/dx5'), title('Theta2 max constraint') 

figure
subplot(231)
semilogx(hxi,Dg9(1,:))
xlabel('Difference step hx'), ylabel('dg1/dx1'), title('Thin walled constraint') 
subplot(232)
semilogx(hxi,Dg9(2,:))
xlabel('Difference step hx'), ylabel('dg1/dx2'), title('Thin walled constraint') 
subplot(233)
semilogx(hxi,Dg9(3,:))
xlabel('Difference step hx'), ylabel('dg1/dx3'), title('Thin walled constraint') 
subplot(234)
semilogx(hxi,Dg9(4,:))
xlabel('Difference step hx'), ylabel('dg1/dx4'), title('Thin walled constraint') 
subplot(235)
semilogx(hxi,Dg9(5,:))
xlabel('Difference step hx'), ylabel('dg1/dx5'), title('Thin walled constraint') 

end










