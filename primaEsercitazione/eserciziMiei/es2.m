%-------------------------
%CONFRONTO CON PUNTO FISSO
%-------------------------


f = @(x) cos(x);
freal = @(x) cos(x)-x;
df = @(x) -sin(x)-1;
x0 = 0;
itmax = 100;
tol = 1e-10;

[vettX, k, scarti] = pfisso(f, x0, tol, itmax);

[xN,iterN,scartiN]=newton(freal,df,x0,tol,itmax);


%--------------------
%PLOTTING RISULTATI
%--------------------

fprintf('La soluzione è: %.10f\n', xN(end));
fprintf('La soluzione è: %.10f\n', vettX(end));

%-------------------------------
%PLOTTING PROFILO DI CONVERGENZA
%-------------------------------


% crea grafico  con il profilo di convergenza di newtonn e tangente fissa
figure(2)
semilogy(1:k,abs(scarti),'m-*',1:iterN,abs(scartiN),'g-o');
title('Profilo di convergenza dei due matodi: punto fisso e Newton per x = g(x);\n');
xlabel('N. iterazioni');
ylabel('scarto/residuo pesato');
legend('Punto fisso','Newton');








