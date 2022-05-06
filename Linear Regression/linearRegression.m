function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
xn = length(x);
yn = length(y);
if xn~=yn
    error('The first and second input need to be equal in size')
end
[y, sortOrd] = sort(y);
x = x(sortOrd);
n = xn;
i1 = (n+1)/4;
i3 = ((3*n)+3)/4;
Q1 = y(floor(i1));
Q3 = y(floor(i3));
IQR = Q3-Q1;
outliers = IQR*1.5;
i = 1;
while i <= yn
    if y(i) < Q1 - outliers || y(i) > Q3 + outliers
        y(i) = [];
        x(i) = [];
        i = i-1;
        yn = yn-1;
        xn = xn-1;
    end
    i=i+1;
end
fX = x;
fY = y;
pts = length(fY);
xy = sum(fX.*fY);
sx = sum(fX);
sy = sum(fY);
sx2 = sum(fX.^2);
barX = mean(fX);
barY = mean(fY);
slope = ((pts*xy)-(sx*sy))/((pts*sx2)-(sx^2));
intercept = barY-(slope*barX);
f = (slope*fX)+intercept;
SStot = sum((fY-barY).^2);
SSres = sum((fY-f).^2);
Rsquared = 1-(SSres/SStot);
end


