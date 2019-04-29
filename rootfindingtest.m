function [root,fx,ea,iter]=rootfindingtest(func,xl,xu,es,maxiter)

if func(xl)*func(xu)>0
     fprintf('Bounds must contain a root. Please input bounds with opposite signs');
end

for iter=0:maxiter
    fxu=func(xu);
    fxl=func(xl);
    xr=(xu-((fxu)*(xl-xu)/(fxl-fxu)));
    fxr=func(xr);
    
    if fxr*fxl<0
    ea=((fxr-fxu)/fxr);
    xu=xr;
    
    else
    ea=((fxr-fxl)/fxr);
    xl=xr;
    end
    
    
    if ea<es
       return;
    end
end

root=xr;
fx=func(xr);

fprintf('The estimated root of the function is x= %.f\n', root);
fprintf('The value of the function at the estimated root is %.f\n', fx);
fprintf('This estimate has a percent relative error of %.f\n', ea);
fprintf('This estimate took %.f iterations.', iter);
end
    