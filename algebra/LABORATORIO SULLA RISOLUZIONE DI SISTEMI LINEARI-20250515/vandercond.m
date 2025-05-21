%Inizializzazione del vettore vcond a zero
vcond=zeros(10,1);
%Crea le matrici di vandermonde di ordine n, n=3,...,10
% a partire dal vettore x = 1:1/(n-1):2 
for n=3:10
    x=1:1/(n-1):2;
    A=vander(x);
%calcola il numero di condizionamento 
    c=cond(A);
%salva il valore nella componente i'esima del vettore vcond
    vcond(n)=c;
pause;
end
%Grafico semilogaritmico del condizionamento 
%in funzione della dimensione della matrice
semilogy(3:10,vcond(3:10),'r-');
title('Grafico semilogaritmico del condizionamento della matrice di Vandermonde');
xlabel('n');
ylabel('Numero di condizionamento');



