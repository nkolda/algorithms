function [root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)
%false position function
%
%Input arguments:  func, function f
%                  xl, lower bound of root
%                  xu, upper bound of root
%                  es, the desired relative error (for default, use
%                       .000001)
%                  maxiter, the desired number of iterations (for default,
%                       use 200)
%
%Output arguments: root, the estimated root location
%                  fx, the function evaluated at the root
%                  ea, the approx. relative error (percent)
%                  iter, how many iterations were performed
%
%Example Call (for x^3):
%                  falsePosition(@(x)x^3,-3,5,.000001,200)
%
%This function uses the false position method to calculate the root of a 
%function in the user defined boundaries, iterations, and relative error.
%The function was created by Noah Kolda on March 1, 2019


%Checks if the user has inputted bounds with opposite signs
if func(xl)*func(xu)>0
     fprintf('Bounds must contain a root. Please input bounds with opposite signs');
end

%Sets parameters for the for loop and defines the calculation for xr
for iter=0:maxiter
    
    fxu=func(xu);
    fxl=func(xl);
    xr=(xu-((fxu)*(xl-xu)/(fxl-fxu)));
    fxr=func(xr);
    
%xr replaces the upper bound if the sign of the function at xr is equal 
%to the sign of the function at xu. The error is approximated with each 
%iteration  
    if fxr*fxl<0
    ea=((fxr-fxu)/fxr);
    xu=xr;

%xr replaces the lower bound if the sign of the function at xr is equal 
%to the sign of the function at xl. The error is approximated with each 
%iteration  
    else
    ea=((fxr-fxl)/fxr);
    xl=xr;
    end
    
%If the error is less than the desired error, the approximation is good
%enough and the program ends
    if ea<es
       return;
    end
end

%re-defines variables to fit into the function
root=xr;
fx=func(xr);

%displays the output variables of the function
fprintf('The estimated root of the function is x= %.f\n', root);
fprintf('The value of the function at the estimated root is %.f\n', fx);
fprintf('This estimate has a percent relative error of %.f\n', ea);
fprintf('This estimate took %.f iterations.', iter);
end
    