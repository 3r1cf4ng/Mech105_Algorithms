function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
if nargin~=2
    error('There are not enough or too many inputs for the function specialMatrix')
end
A = zeros(n,m);
S = size(A);
y=1;
x=1;
t=1;
for k=(1:S(2))
    A(1,y)= t
    t=t+1;
    y=y+1;
end
z=1;
for j=(1:S(1))
    A(x,1)= z
    z=z+1;
    x=x+1;
end
r=2;
while r<=S(1)
c=2;
for p=(1:S(2)-1)
A(r,c)=A((r-1),c)+A(r,(c-1))
c=c+1;
end
r=r+1;
% Now the real challenge is to fill in the correct values of A
end
% Things beyond here are outside of your function
