
%-----------
%PRIMO ESERCIZIO DI MATLAB
%

f=@(x) (x-1).^2*log(x); 
df = @(x)(x-1).*2*log(x) + (x-1)^2*1/x;

a = 1;
b = 4;
toll = 1e-8;
itmax = 100;
x0 = 2;
r = 3;

[x,iterN,scarti]=newton(f,df,x0,toll,itmax);

[t,iterNi,scarti2]=newtonmod(f,df,x0,toll,itmax,r);

%confronto dei profili di convergenza del metodo di newton normale e
%aggiornato con la molteplicità dello 0


figure(1)
semilogy(1:iterN,abs(scarti),'m-*',1:iterNi,abs(scarti2),'g-o');
title('Profilo di convergenza dei due metodi per f(x)=x^2 -5x +6');
xlabel('N. iterazioni');
ylabel('scarto/residuo pesato');
legend('Newton','Newtonmod');
print -dpdf grafico1.pdf

