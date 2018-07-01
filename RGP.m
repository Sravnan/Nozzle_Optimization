function [ x,obj,iter] = RGP(x0,maxiter )
%Rosen's Gradient Projection Method
KKT = false;
iter = 1;
x = x0;
while (~KKT)&&(iter<maxiter)
%% Search along direction
    
    %Determine gradient
    [dfdx,dgdx] = Gradient(x);
    %Boundaries met or exceed?
    gx = constraintNormal(x);
    bound = any(abs(gx)<1e-3); 
    %Get back to boundary

    %% Determine new best direction
    % Projection onto constraint surface
    dfdx = -0.1*dfdx/(norm(dfdx));
    if bound
       conAct = abs(gx)<1e-2;
       dgAct = dgdx(:,conAct);
       P = eye(length(x0)) - dgAct*inv(dgAct'*dgAct)*dgAct';
       searchVec = P*dfdx;
    else
       searchVec = dfdx;
    end
    searchVec
    %Perform linesearch in direction of optimal search Vector
    [x,obj] = lineSearch(@thrust,searchVec,x,[0,0.1],15,10);
    x
    
    while any(gx>1e-3)
        conAct = gx>0;
        dgAct = dgdx(:,conAct);
        dhtdh = -inv(dgAct'*dgAct);
        ck = dhtdh*gx(conAct)';
        x = x+dgAct*ck;
        [~,dgdx] = Gradient(x);
        gx = constraintNormal(x); 
    end
    %% Check KKT conditions
    % checking feasibility
    ineq = gx < 0;
    % Identify independent active constraints
    % Compute lagrange multipliers    
%     lagMult(conAct) = -dgAct\dfdx;
%     lagMult(~conAct) =  0;
%     % Check Multiplier values
%     if all(lagMult)>0
%         KKT = true;
%     end
    iter = iter+1;
end
end

