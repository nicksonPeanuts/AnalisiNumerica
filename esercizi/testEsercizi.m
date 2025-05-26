

A = [1 1 1; 2 -1 1; 1 -1 -1];

[L,U] = lugauss(A);

disp(L);
disp(U);

b = [3;1;3];

x = A\b;

B = [2 1 1; 1 2 1; 1 1 2];
det(B);