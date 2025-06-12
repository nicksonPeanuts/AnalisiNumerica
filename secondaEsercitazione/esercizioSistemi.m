
%ESERCITAZIONE PAG 25 DISPENSA

format long;

epsilon = 10e-14;
A = [1 1 -3; 2 2-epsilon 4; 1 9 4];

x_vero = [1 1 1]';

b = A*x_vero;
disp(b);

x = A\b;
disp(x);

residuo_relativo = norm(b-A*x)/norm(b);
errore_relativo = norm(x-x_vero)/norm(x);

fprintf("residuo relativo: %f\n", residuo_relativo);
fprintf("errore relativo: %f\n", errore_relativo);

%eseguiamo ora i calcoli con LU di matlab

[L,U,P] = lu(A);

y = L\b;

x_lu = U\y;
disp(x_lu);

residuo_relativo = norm(b-L*U*x)/norm(b);
errore_relativo = norm(x-x_lu)/norm(x);
fprintf("residuo relativo con lu: %f\n", residuo_relativo);
%disp(residuo_relativo);
fprintf("errore relativo con lu: %f\n", errore_relativo);
%disp(errore_relativo);


