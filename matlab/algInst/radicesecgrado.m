%------------------------------------------%
% CODICE MATLAB per il calcolo della radice
%y=-p+sqrt(p^2+q) di x^2 + 2\,p x -q, con
%sqrt(p^2+q) >= 0
%------------------------------------------%
%Caso test 1
p=1000; q=0.018000000081; sol=0.9*10^(-5);
%Caso test 2
%p=4.999999999995*10^(+4); q=10^(-2); sol=10^(-7);
%Caso test 3
p=0.5e7; q=1e-2; sol=1e-9;

% ALGORITMO 1
s=p^2;
t=s+q;
if t >=0
   u=sqrt(t);
else
   fprintf('\n \t [RADICI COMPLESSE]');
end
s1=-p+u;

% ALGORITMO 2
s=p^2;
t=s+q;
if t >=0
   u=sqrt(t);
else
   fprintf('\n \t [RADICI COMPLESSE]');
end
v=p+u;
t1=q/v;

% STAMPA RISULTATI
fprintf('\n \t [ALG.1]: %10.16f',s1);
fprintf('\n \t [ALG.2]: %10.16f',t1);
if  (sol ~= 0)
    rerr1 =abs(s1-sol)/abs(sol);
    rerr2=abs(t1-sol)/abs(sol);
    fprintf('\n \t [REL.ERR.ALG.1]: %2.2e',rerr1);
    fprintf('\n \t [REL.ERR.ALG.2]: %2.2e',rerr2);
end
fprintf('\n ');

                                                                
