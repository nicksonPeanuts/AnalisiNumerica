function [x,iter,scarti] = newtonmod(f, df, x0, tol, itmax, r)
%----------------------------------------------------------------
% NEWTONMOD: calcola una radice multipla della funzione f 
% usando il metodo di Newton modificato
%----------------------------------------------------------------
% [x,iter,scarti] = newtonmod(f, df, x0, tol, itmax, r)
%----------------------------------------------------------------
% parametri di input: 
%        f: funzione della quale si cerca una radice
%        df: derivata prima di f
%        x0: approssimazione iniziale
%        tol: tolleranza  
%        itmax: numero massimo di iterazioni 
%        r: molteplicità della radice
% parametri di output: 
%        x: vettore delle approssimazioni della radice 
%        iter: numero di iterazioni effettuate
%        scarti: vettore degli scarti successivi
%----------------------------------------------------------------

xold = x0;
x = [x0];
scarti = [];
dif = tol + 1;
iter = 0;

while (abs(dif) > tol) && (iter < itmax)
    fx = feval(f, xold);
    if fx == 0 
        return;
    end
    dfx = feval(df, xold);
    if dfx == 0
        disp('ERRORE: derivata nulla.'); return;
    end
    iter = iter + 1;
    dif = -r * fx / dfx;  % Newton modificato
    xnew = xold + dif;
    scarti = [scarti; dif];
    x = [x; xnew];
    xold = xnew;
end

if (iter >= itmax)
    disp('Raggiunto il numero massimo di iterazioni');
end

fprintf('\n');

end