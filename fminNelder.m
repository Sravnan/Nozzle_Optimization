%% Running both fmincon and nelder to find optimum design
%
%
%
%
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

tic
options = optimset('Display','iter');
for ii=1:length(p)
    fun1=@(y)objPenalty(y,p(ii));
    y=fminsearch(fun1,y0,options);
    y0=y;
    optimumM(ii,:)=y;
end
toc
%%
options = optimoptions('fmincon','Display','iter','ConstraintTolerance',1e-9,'StepTolerance',1e-9);%
tic
[x,fval,z,s]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
toc
%%

%%
tic
rgp=RGP(x0,1000);
toc

%%
tic
[opti,optimum]=nelder(x0);
toc
