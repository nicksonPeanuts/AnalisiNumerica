%-------------------------------------------------
% Studio dell'instabilita' del MEG senza pivoting
%-------------------------------------------------

n = 3
xvera = ones(n,1);
epsilon = 1e-14;
A = [1 1 -3; 2 2-epsilon 4; 1 9 4];
b = A* xvera;
disp('Usando la fattorizzazione LU calcolata senza pivoting')
[L,U] = lugauss(A);
disp('A - LU')
A - L*U
y = L\b;
x = U\y
err_rel = norm(x-xvera)/norm(xvera)
res_rel = norm(b-A*x)/norm(b)

