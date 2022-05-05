function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
if nargin ~= 1
    error('need a single array input')
end
[m,n]=size(A);
if m==1 && n==1
    error('input is not a system of equations')
elseif m~=n
    error('the system of equations is invalid')
end
P=eye(n);
L=zeros(n);
k=1;
j=k+1;
while k<=n
[Max,Index]=max(abs(A(k:end,k))); %Index is the row it is located for column 1
Index=Index+(k-1);
       A([k,Index],:)=A([Index,k],:);
       P([k,Index],:)=P([Index,k],:);
       L([k,Index],:)=L([Index,k],:);
for i=j:m
    aik=A(i,k)/A(k,k);
    L(i,k)=aik;
    a1=aik.*A(k,:);
    a2=A(i,:);
    ap=a2-a1;
    A(i,:)=ap;
end
k=k+1;
j=j+1;
end
U=A;
L=L+eye(m);
end