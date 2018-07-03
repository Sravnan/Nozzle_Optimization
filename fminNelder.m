%% Running both fmincon and nelder to find optimum design
%
%
%
%
%
x0=[40;10;1.2;20;2.8];
A=[];
b=[];
Aeq=[];
beq=[];
lb=[0,1.1,0,0,0];
ub=[];
fun=@thrust ;
p=[500 1000 2000 4000 8000 16000 32000 64000 128000 256000 512000];
nonlcon=@constraintNormal;

options = optimset('Display','iter');
for ii=1:length(p)
    fun1=@(x)objPenalty(x,p(ii));
    x=fminsearch(fun1,x0,options);
    x0=x;
    optimumM(ii,:)=x;
end
% optiM=optimum(end,:);
% options = optimoptions('fmincon','Display','iter','ConstraintTolerance',1e-9,'Algorithm','sqp-legacy');%
% tic
% [x,fval,y,s]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
% toc

%%
% tic
% [opti,optimum]=nelder(x0);
% toc
