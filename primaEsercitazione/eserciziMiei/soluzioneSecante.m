%---------------------------
%EQUAZIONE SECANTE VARIABILE
%---------------------------


f = @(x) exp(-x) + cos(x) - 3;

x0 = 1;             % punto iniziale
itmax = 100;        % massimo numero di iterazioni
tol = 1e-6;         % tolleranza

[iter, x, scarti] = secvariabile(f, x0, 2, itmax, tol);

fprintf('Radice approssimata: %.10f\n', x(end));


