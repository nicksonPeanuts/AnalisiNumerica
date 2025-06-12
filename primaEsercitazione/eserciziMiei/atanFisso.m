%----------------------------
%   Esercizio x = 1 + atan(x)
%   con punto fisso
%
%----------------------------

% questa la funzione originale
f = @(x) 1 + atan(x) - x;

%funzione g(x)
ffpoint = @(x) 1 + atan(x);

x0 = 0;
itmax = 100;
tol = 1e-10;

[xvec, k, scarti] = pfisso(ffpoint, x0, tol, itmax);

%PRINTING A SCHERMO

fplot(ffpoint, [-5 5]);
hold on
xx = linspace(-10,10,10);

plot(xx, zeros(size(xx)), 'g-','LineWidth', 2);
hold off

%PLOTTING DEL PROFILO DI CONVERGENZA DEL METODO

figure(2)
semilogy(1:k,abs(scarti),'m-*');
title('Profilo di convergenza per x = g(x);\n');
xlabel('N. iterazioni');
ylabel('scarto/residuo pesato');
legend('Punto fisso');

fid = fopen('pfisso.txt', 'w');
fprintf(fid, '%6s\t%20s\t%20s\n', 'iter', 'x_k', 'scarto');

for i = 1:k
    fprintf(fid, '%6d\t%20.14f\t%20.10e\n', i, xvec(i+1), scarti(i));
end

fclose(fid);

