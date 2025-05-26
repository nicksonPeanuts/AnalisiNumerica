A = [2 -1 0.5; 6 4 3; -3 12 3];

disp(A);

[L, U] = lugauss(A);
disp(L);
disp(U);