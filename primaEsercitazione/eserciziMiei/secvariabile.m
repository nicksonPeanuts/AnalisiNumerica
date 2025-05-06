%funzione per la secante variabile

function[iter, x, scarti] = secvariabile(f, x0, x1, itmax, tol)
    xoldold = x0;
    xold = x1;

    x = [x0; x1];    % includi entrambi i punti iniziali
    scarti = [];

    iter = 0;
    dif = tol + 1;   % forza ingresso nel ciclo
    
    while (abs(dif) > tol) && (iter < itmax)
        %passi iterativi
        fx = feval(f, xold);
        fxold = feval(f, xoldold);

        hk = (fx - fxold)/(xold - xoldold);
        dif = -fx/hk;
        xnew = xold + dif;
        scarti = [scarti; abs(dif)];
        x =[x; xnew];
        xoldold = xold;
        xold = xnew; 
        iter = iter+1;

    %criterio di arresto test sullo scarto e delle massime iterazioni
    end
    if (iter >= itmax)
        disp('Raggiunto il numero massimo di iterazioni');
    end
    fprintf('\n');
