%------------------------------------------
% SCRIPT CHE IMPLEMENTA LA  SUCCESSIONE RICORRENTE
%------------------------------------------
clear all;

% SUCCESSIONE "s_n".
s(1)=exp(-1);   
for n=1:99
    s(n+1)=1-(n+1)*s(n);
end

% SUCCESSIONE "t_n".
M=200;
t=zeros(M,1); % INIZIALIZZAZIONE "t".
for n=M:-1:2
    j=n-1;
    t(j)=(1-t(n))/n;
end

% PLOT SEMI-LOGARITMICO.           
clf;
%------------------------------------------
% GRAFICO: PLOT SEMI-LOGARITMICO. 
%------------------------------------------
semilogy(1:length(s),abs(s),'k-'); 
hold on;
semilogy(1:length(s),abs(t(1:length(s))),'m-');
hold off;
title('Valori generati dalle successioni in avanti e all''indietro');
legend('avanti','indietro','location','northwest');
xlabel('n');
