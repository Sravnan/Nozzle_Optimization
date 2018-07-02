%% Running both fmincon and nelder to find optimum design
%
%
%
%
%
clear all
x0=[30;15;1;30;4];
A=[];
b=[];
Aeq=[];
beq=[];
lb=[0,1.1,0,0,0];
ub=[];
fun=@thrust ;
nonlcon=@constraintNormal;
options = optimoptions('fmincon','Display','iter','ConstraintTolerance',1e-9,'Algorithm','sqp-legacy');%
tic
[x,fval,y,s]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
toc

%%
tic
opti=nelder(x0);
toc
