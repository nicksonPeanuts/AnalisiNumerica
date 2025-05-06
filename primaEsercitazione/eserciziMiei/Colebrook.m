
et = 1e-2;
d = 0.20;
Nr = 1e4;
itmax = 100;
tol = 1e-8;

fnormale = @(x) (1 ./ sqrt(x)) + 2 * log10( (et ./ (3.51 .* d)) + (2.52 ./ (Nr .* sqrt(x))) );
fptfisso = @(x) 1 / (-2 * log10( et/(3.51*d) + 2.52/(Nr*sqrt(x)) ) )^2;

x0 = 1;
[xvec, k, scarti] = pfisso(fptfisso, x0, tol, itmax);

fprintf('\nIterazioni punto fisso:\n');
for i = 1:length(xvec)
    fprintf('xvec(%2d) = %.10f\n', i-1, xvec(i));  % i-1 perché xvec(1) = x0
end


x0 = 0.01;
x1 = 0.1;
[iterSec, xSec, scartiSec] = secvariabile(fnormale, x0, x1, itmax, tol);

fprintf('Soluzione punto fisso: %.10f\n', xvec(end));
fprintf('Soluzione secante variabile: %.10f\n', xSec(end));


% crea grafico  con il profilo di convergenza di newtonn e tangente fissa
figure(2)
semilogy(1:k,abs(scarti),'m-*',1:iterSec,abs(scartiSec),'g-o');
xlabel('N. iterazioni');
ylabel('scarto/residuo pesato');
legend('punto fisso','secante variabile');
