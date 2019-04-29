function I = Simpson(x,y)
%Simpsons 1/3 method algorithm with trapezoidal rule
%
%Input arguments:  x, an input array of x values
%                  y, an input array of y values
%
%Output arguments: I, the evaluated integral of the given inputs
%
%Example Call:
%               x=([1,2,3,4])
%               y=([1,2,3,4])
%               Simpson(x,y)
%
%This function calculates the integral given 2 input arrays, x and y. It
%uses an iteration of the trapezoidal rule when there are an odd number of
%intervals.
%The function was created by Noah Kolda on April 16, 2019


%error checks
x=x(:);
%checks that the input arrays are of equal length
if length(x) ~= length(y)
    error('Inputs must be the same length')
end

%checks the spacing of the input arrays and makes sure that they are
%equally spaced
spacing=range(x(2:end)-x(1:end-1));
if spacing~=0
    error('The x input must be equally spaced')
end

%starting calculations

n=0;
index=1:length(x);
%calculates the integral using simpsons 1/3 rule
if rem(index(length(x)), 2) ~= 0
    fprintf('The trapezoidal rule will be used on the last interval');
        stepsize=(x*(length(x))-x(1))/(length(x)-1);
        I=(stepsize/3)*(sum(2*y(rem(index,2)~=0)+sum(4*y(rem(index,2)==0))-y(1)-y(length(x))));
        
        %trapezoidal rule (only for odd number of intervals)
        I=trapz(x,y);
   
else
        %calculates using simpsons 1/3 without the trapezoidal rule
        stepsize=(x(length(x))-x(1))/(length(x)-1);
        I=(stepsize/3)*(sum(2*y(rem(index,2)~=0)+sum(4*y(rem(index,2)==0))-y(1)-3*y(length(x))));
    end
end







