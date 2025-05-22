esp=1:15;
x=10.^-esp;
ris=(1+x)-1;

%Calcolo dell'errore relativo
errrel=abs(x-ris)./abs(x);

%Tabulazione
A=[x' ris' errrel'];

%stampa a video dei risultati
%format long e
%disp(A);
fprintf('%14s %20s %17s \n','x','(1+x)-1', 'Err-rel');
fprintf('%17.3e %24.15e %10.2e \n',A');

%Grafico degli errori relativi
loglog(x,errrel,'b-*');
title('Errore relativo su (1+x)-1')
xlabel('x')
ylabel('Errore relativo')
