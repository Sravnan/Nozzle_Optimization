function [Aconv,y,x] = geometryConvergent( designVec,n )
%Geometry of Convergent section

%% Check if simplified problem
if length(designVec)==2
    rt = designVec(1);
    eps = designVec(2);
    t = Constants.t;
    theta1 = Constants.theta1;
    theta2 = Constants.theta2 ;
else
    rt = designVec(1);
    eps = designVec(2);
    t = designVec(3);
    theta1 =designVec(4);
    theta2 = designVec(5);
end
y = zeros(n,1);
Aconv = zeros(n,1);
x = linspace(0,Constants.xconv,n);

xp=0.382*rt*sin(Constants.beta);
yp =rt+(1-cos(theta1))*0.382*rt;

for ii = 1:n
    if x(ii)<xp
        theta=asin(x(ii)/(0.382*rt));
        r= rt-(cos(theta)*0.382*rt-0.382*rt);
    else
        r = yp+sin(Constants.beta)*(x(ii)-xp);
    end
    y(ii) = r;
    Aconv(ii) = pi*r^2;
end
Aconv = flipud(Aconv);
y = flipud(y);
end

