function [ x,obj,iter] = ZFD( F,C,x0,maxiter )
%Zoutendijk's feasible direction method for constrained problem
%optimization
KKT = False;
iter = 1;
x = x0;
while (~KKT)&&(iter<maxiter)
%% Search along direction
    %Determine gradient
    [dfdx,dgdx] = Gradient(x);
    %Boundaries met or exceed?
    gx = constraintNormal(x);
    bound = any(gx) > 0; 
    %Get back to boundary
    while bound
        conAct = gx>0;
        dgAct = dgdx(:,conAct);
        ck = -inv(dgAct'*dgAct)*g;
        x = x+gradAct*ck;
        gx = constraintNormal(x); 
        bound = any(gx) > 0;
    end
    %% Determine new best direction
    % Projection onto constraint surface
    if bound
       conAct = abs(gx)<1e-2;
       dgAct = dgdx(:,conAct);
       P = eye(length(x0)) - dgAct*inv(dgAct'*dgAct)*dgAct';
       searchVec = P*dfdx;
    else
       searchVec = dfdx;
    end
    %Perform linesearch in direction of optimal search Vector
    [x,obj] = lineSearch(F,searchVec,x,[0,1],15,10);
    %% Check KKT conditions
    % checking feasibility
    ineq = gx < 0;
    % Identify independent active constraints
    % Compute lagrange multipliers    
    lagMult(conAct) = -dgAct\dfdx;
    lagMult(~conAct) =  0;
    % Check Multiplier values
    if all(lagMult)>0
        KKT = true;
    end
    iter = iter+1;
end
end
