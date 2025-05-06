
%------------
%
%PUNTO FISSO
%
%------------

function [xvec, iter, scarti]= pfisso(g, x0, tol, maxit)
     scarti = [];
     iter = 0;
     xvec = [x0];
     dif = 1;
     while (abs(dif) > tol) && (iter < maxit)
        geval = feval(g, x0);
        iter=iter+1;
        dif = geval - x0;
        scarti=[scarti;dif];
        xvec=[xvec; geval];
        x0 = geval;
     end
     if (iter >=maxit)
        disp('raggiunto il numero massimo di iterazioni')
     end
 fprintf('\n');











