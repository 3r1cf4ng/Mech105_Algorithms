function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
[m,n] = size(x);% m should just equal 1 for all x inputs
[fm,fn] = size(y);
if m ~= fm || n ~= fn
    error('The inputs should have corresponding values')
end
f = 1;
for i=1:n-2
    s1 = x(m,f)-x(m,f+1);
    s2 = x(m,f+1)-x(m ,f+2);
    if s1 == s2
        f=f+1;
    else
        error('The spacing is not proper')
    end
end
if n==3
    a = x(1,1);
    b = x(1,3);
    h = b-a;
    I = (h*(y(1,1)+(4*y(1,2))+y(1,3)))/6;
end
if n==2
    a = x(1,1);
    b = x(1,2);
    h = b-a;
    warning('There are only 2 points, so trapezoidal rule is used')
    I = (h*(y(1,1)+y(1,2)))/2;
end
if rem(n,2)==0 && n>3
I = 0;
f = 1;
for i = 1:(n-1)/2
a = x(m,f);
b = x(m,f+2);
h = b-a;
f0 = y(m,f);
fx = y(m,f+1);
fn = y(m,f+2);
Ix = ((h)*(f0+(4*fx)+fn)/6);
f=f+2;
I = I + Ix;
end
x = [x(m,n-1),x(m,n)];
y = [y(m,n-1),y(m,n)];
warning('There is an odd number of intervals, so trapezoidal rule is applied to the last interval');
I = trapz(x,y) + I;
end

if rem(n,2)~=0 && n>3
I = 0;
f = 1;
for i = 1:(n-1)/2
a = x(m,f);
b = x(m,f+2);
h = b-a;
f0 = y(m,f);
fx = y(m,f+1);
fn = y(m,f+2);
   Ix = ((h)*(f0+(4*fx)+fn)/6);
   f=f+2;
   I = I + Ix;
end
end