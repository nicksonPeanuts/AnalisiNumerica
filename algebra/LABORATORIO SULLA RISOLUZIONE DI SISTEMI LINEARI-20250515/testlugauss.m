A = [2  1  0 ;  1 2  1 ; 0  1  2]
n=size(A,1);
b = A*ones(n,1);
[L,U]=lugauss(A);
y=L\b;
x=U\y
