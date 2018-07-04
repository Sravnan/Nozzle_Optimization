%% Running both fmincon and nelder to find optimum design
%
%
%
%
%
x0=[30;15;2;30;4];
A=[];
b=[];
Aeq=[];
beq=[];
lb=[1,1.5,0.5,15,0];
ub=[];
fun=@thrust ;
p=[500 1000 2000 4000 8000 16000 32000 64000 128000 256000 512000];
nonlcon=@constraintNormal;

options = optimset('Display','iter');
for ii=1:length(p)
    fun1=@(y)objPenalty(y,p(ii));
    y=fminsearch(fun1,x0,options);
    x0=y;
    optimumM(ii,:)=y;
end

% options = optimoptions('fmincon','Display','iter','ConstraintTolerance',1e-9,'Algorithm','sqp');%
% 
% x0=[30;15];
% [x,fval,z,s]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
% 
% x0=[30;15];
% %
% tic
% [opti,optimum]=nelder(x0);
% toc
% x0=[30;15];
% rgp=RGP(x0,1000);



