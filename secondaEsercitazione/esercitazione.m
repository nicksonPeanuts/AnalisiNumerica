%   ---------------------
%   ESERCITAZIONE MATLAB
%   ---------------------



% ---------a---------------- 
% Definisca la matrice A come la matrice di Hilbert di ordine n = 8 e poi cambi i primi
% due elementi della seconda riga nel modo seguente: A(2, 1) = 2 ∗ A(1, 1) e A(2, 2) =
% 2 ∗ A(1, 2) − e, fissato e = 10−12.

n = 8;
A = ones(n);
epsilon = 1e-12;

% a(i,j) = 1/i+j-1 for loop

for i = 1:n
    for j = 1:n
        A(i,j) = A(i,j) / (i+j-1);
    end 
end 

% A ora è di hilbert
% modifiche della seconda riga
A(2,1) = 2*A(1,1);
A(2,2) = 2*A(1,2) - epsilon;



% ---------b---------------- 
% si definisca il termine noto b in modo che la soluzione esatta del sistema sia il vettore con
% tutte le componenti pari a 1

% Ax = b definire b in modo che x sia uguale a 1,1....,1 

x_esatta = ones(8,1);
b = A * x_esatta;
disp(b);

% ---------c--------------- 
% alcoli la soluzione del sistema lineare Ax = b a partire dalla fattorizzazione LU della
% matrice A calcolata mediante la function lugauss, e quindi risolvendo i due sistemi triangolari
% mediante il comando \ di Matlab .


[L, U] = lugauss(A);

% Ax = b -> LUx = b -> Ly = b -> Ux = y
y = L\b;

x = U\y;

%---------d--------------
% visualizzi a video il vettore soluzione ottenuto. Si usi format long per vedere tutte le cifre
% significative.


format long;

disp("Vettore risultato in formato long: ");
disp(x);



%--------e---------------
%   Calcoli il residuo relativo rrel e l'errore relativo erel

rrel = norm(b-A*x_esatta) / norm(b);
erel = norm(x-x_esatta)/ norm(x_esatta);


disp(rrel);
disp(erel);


%--------f---------------
% Ripeta i punti (b)-(e) ma risolvendo il sistema questa volta con la fattorizzazione LU con
% pivoting fornita dalla function Matlab [L,U,P] = lu(A).


[L,U,P] = lu(A);

%risoluzione punto b sempre uguale, non c'è fattorizzazione
%risoluzione punto c usando lu con pivoting

%risolvo Ly = Pb

y = L\P*b; 

%risolvo Ux = y

x = U\y;

%punto d
disp(x);


%risoluzione punto e

rrel = norm(b-A*x_esatta) / norm(b);
erel = norm(x-x_esatta)/ norm(x_esatta);


disp(rrel);
disp(erel);



% RISPOSTA ALLE DOMANDE
%   Perché il residuo relativo nel primo caso (LU calcolata senza pivoting) non è dell’ordine
%   della precisione di macchina?








