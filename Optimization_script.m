%% Running all models to fin the optimum designs 
% Recomended to run per section since custom Nelder-Mead needs extra
% constraints activated.
%
% Design vectors can also be given with onlu throat radius and expantion
% ratio this wil result in the model to choose the standars value for the
% thickness, theta1 and theta2. 
%
% Setting up input values
y0=[30;15;2;30;4];
x0=[30;15;2;30;4];
A=[];
b=[];
Aeq=[];
beq=[];
lb=[1,1.5,0.5,15,0];
ub=[];
fun=@thrust ;
z=6:16;
p=10.*2.^z;
nonlcon=@constraintNormal;

%% Running fminsearch
tic
options = optimset('Display','iter');
for ii=1:length(p)
    fun1=@(y)objPenalty(y,p(ii));
    y=fminsearch(fun1,y0,options);
    y0=y;
    optimumM(ii,:)=y;
end
toc
%% Running fmincon 
options = optimoptions('fmincon','Display','iter','ConstraintTolerance',1e-9,'StepTolerance',1e-9);%
tic
[x,fval,z,s]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
toc

%% Running custom RGP
tic
rgp=RGP(x0,1000);
toc

%% Running custom Nelder-Mead, remember to activate constraint 10 and 11
tic
[opti,optimum]=nelder(x0);
toc
