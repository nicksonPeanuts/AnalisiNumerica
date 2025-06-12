%--------------------
%definizione funzione
%--------------------


f = @(x) exp(-x)+ cos(x)-3;

df = @(x) -exp(-x) -sin(x);

intervals = [-10 10];


xx = linspace(-100,100,100);

plot(xx, zeros(size(xx)), 'g-','LineWidth',2);

%risoluzione esercizio

x0 = -1;
itmax = 100;
tol = 1e-9;
[x,iter,scarti]=tfissa(f,df,x0,tol,itmax);
[xN,iterN,scartiN]=newton(f,df,x0,tol,itmax);

% crea grafico  con il profilo di convergenza di newtonn e tangente fissa
figure(2)
semilogy(1:iterN,abs(scartiN),'m-*',1:iter,abs(scarti),'g-o');
title('Profilo di convergenza dei due metodi per f(x)=exp(-x)+ cos(x)-3;');
xlabel('N. iterazioni');
ylabel('scarto/residuo pesato');
legend('Newton','TangenteFissa');


