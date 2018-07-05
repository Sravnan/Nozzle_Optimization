function [ x,obj,iter] = RGP(x0,maxiter )
%Rosen's Gradient Projection Method
KKT = false;
iter = 1;
x = x0;
xold = x0;
while (~KKT)&&(iter<maxiter)
%% Search along steepest descent direction
    
    %Determine gradient
    [dfdx,dgdx] = Gradient(x);
    %Boundaries met or exceed?
    gx = constraintNormal(x);
    bound = any(abs(gx)<1e-3); 
    %Get back to boundary

    %% Determine new best direction
    % Projection onto constraint surface
    if bound
       conAct = abs(gx)<1e-3;
       dgAct = dgdx(:,conAct);
       P = eye(length(x0)) - dgAct*inv(dgAct'*dgAct)*dgAct';
       searchVec = -P*dfdx;
       
    else
       searchVec = -dfdx;
    end
    if norm(searchVec) > 1 
        searchVec = searchVec/norm(searchVec);
    end
    %Perform linesearch in direction of optimal search Vector
    [x,obj] = lineSearch(@thrust,searchVec,x,[0,10],15,10);
    gx = constraintNormal(x);
    jter = 1;
    while any(gx>1e-3)
        conAct = gx>1e-3;
        dgAct = dgdx(:,conAct);
        dhtdh = -inv(dgAct'*dgAct);
        ck = dhtdh*gx(conAct)';
        tk = dgAct*ck;
        if norm(tk)>1
            tkscale = tk/norm(tk);
        else
            tkscale = tk;
        end
        x = x+tkscale;
        [dfdx,dgdx] = Gradient(x);
        gx = constraintNormal(x); 
        jter = jter+1;
    end
    
    %% Check KKT conditions
    
    difference = norm(x-xold);
    if difference<1e-2
        % creating gbar matrix with active constraint
        gAct=abs(gx)<1e-3;
        gbar=dgdx(:,gAct);
        % Least sqares approximation of the lagrange multipliers
        % Gbar with transpose gbar
        A=gbar'*gbar;
        % fgrad with gbar transpose
        y=gbar'*dfdx;
        %solving
        mu=-A\y;
        if all(mu>-1e-3)&&(~isempty(mu))
            KKT = true;
        end
    end
    
    xold = x;
    iter = iter+1;
end

end

