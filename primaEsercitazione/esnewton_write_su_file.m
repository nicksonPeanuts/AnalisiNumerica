% --------------%
% CASO TEST 1   %
% --------------%
%Definisce la funzione e la sua derivata
f=@(x) x.^2 -5*x +6 ; 
df=@(x) 2*x -5;

% inizializza i parametri
toll=1e-8;
itmax=100;
a=1;b=4;


%Disegna la funzione f(x) e l'asse x nella stessa figura
figure(1)
h=ezplot(f,[a b]);
set(h, 'Color','b','Linestyle','-','LineWidth',2);
hold on; plot([a b],[0 0],'k-');hold off;

% chiamata alla function bisezione
[c,iter,semilun,res]=bisezione(2.5,b,toll,toll,itmax,f);

fid=fopen('ris_bis_Newton.txt','w');
% stampa a video dei risultati
for k=1:iter
fprintf(fid,'\n [k]:%3.0f [c]: %15.15f [AMP]: %2.2e [WRES]:%2.2e  ',k,c(k),semilun(k),res(k));
end
fprintf(fid,'\n');

% chiamata alla function newton
x0=3.5;
[x,iterN,scarti]=newton(f,df,x0,toll,itmax);

%Stampa a video dei risultati 
fprintf(fid,'\n [k]: %2.0f \t [xk]: %10.15f \t [dif]: ',1,x(1));
for k=2:iterN+1
fprintf(fid,'\n [k]: %2.0f \t [xk]: %10.15f \t [dif]: %10.2e',k,x(k),scarti(k-1));
end
fprintf(fid,'\n');
fclose(fid);

% crea grafico  con il profilo di convergenza
figure(2)
semilogy(1:iter,abs(res),'m-*',1:iterN,abs(scarti),'g-o');
title('Profilo di convergenza dei due metodi per f(x)=x^2 -5x +6');
xlabel('N. iterazioni');
ylabel('scarto/residuo pesato');
legend('bisezione','Newton');
print -dpdf grafico1.pdf

