function [ Tin,Tout ] = Tsolve( Tin0,Tout0,hin,hout,Tcool,Tr,Tamb,sigma,k,t)
Tsin = Tin0;
Tsout = Tout0;
tol = 0.1;
delta = 1;
dT = 0.001;

while delta > tol
    eq1 =@(Tin,Tout)real( hin  * (2*Tr/(Tr + Tin))^(2/3)*(Tr - Tin) - k/t *(Tin - Tout)) ;
    eq2 =@(Tin,Tout)real( -hout* (Tout - Tcool) - sigma * (Tout^4-Tamb^4)+ k/t *(Tin - Tout)) ;
    
    h = [eq1(Tsin,Tsout);eq2(Tsin,Tsout)];
    deq1dTin = (eq1(Tsin+dT,Tsout)-h(1))/dT;
    deq2dTin = (eq2(Tsin+dT,Tsout)-h(2))/dT;
    deq1dTout = (eq1(Tsin,Tsout+dT)-h(1))/dT;
    deq2dTout =(eq2(Tsin,Tsout+dT)-h(2))/dT;
    deqdT = [deq1dTin,deq2dTin;
             deq1dTout,deq2dTout];
    ck = -inv(deqdT'*deqdT)*h;
    deltaT = deqdT*ck;  
    delta = norm(deltaT);
    Tsin = Tsin+ deltaT(1);
    Tsout= Tsout + deltaT(2);
end
Tin = Tsin;
Tout = Tsout;

end

