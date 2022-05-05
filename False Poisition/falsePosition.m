function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
ea = 100;
iter = 0;
if nargin < 3
    error('There must be at least 3 inputs')
elseif nargin == 3
    es = 0.0001;
    maxit = 200;
elseif nargin == 4
    maxit = 200;
elseif nargin > 6
    error('Too many inputs')
end
fl = func(xl);
fu = func(xu);
if (fl*fu) >= 0
    if fl == 0
        root = xl;
        fx = fl;
        ea = 0;
    elseif fu == 0
        root = xu;
        fx = fu;
        ea = 0;
    else
    error('The brackets either do not bracket a root, or the brackets are too far away from one another')
    end
end
xr1 = xl;
while ea > es
if iter > maxit
    iter = iter-1;
    root = xr;
    fx = fr;
    disp('Hit max iterations')
    break
end
xr = (xu-((fu*(xl-xu))/(fl-fu)));
fr = func(xr);
if fr ~= 0
    ea = abs((xr-xr1)*100/xr);
    xr1 = xr;
    if(fl*fr) > 0
        xl = xr;
        fl = func(xl);
    elseif (fu*fr) > 0
        xu = xr;
        fu = func(xu);
    else
       disp('xr is a root')
    end
end
if fr == 0
    root = xr;
    fx = fr;
    ea = 0;
end
    iter = iter+1;
end
if ea < es
    root = xr;
    fx = fr;
end
end