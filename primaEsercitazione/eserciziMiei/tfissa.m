
%---------------------------
%METODO DELLA TANGENTE FISSA
%---------------------------


function [x,iter,scarti]=tfissa(f,df,x0,tol,itmax)
 xold=x0;
 x=[x0];
 scarti=[];
 dif =tol+1; 
 iter=0;
 dfx=feval(df,x0);
 while (abs(dif) > tol) & (iter < itmax)
    fx=feval(f,xold);
    if fx == 0 
        return; 
    end
    if dfx == 0 
       disp('ERRORE: derivata nulla.'); return; 
    end
    iter=iter+1;
    dif=-fx/dfx;
    xnew=xold+dif;
    scarti=[scarti;dif];
    x=[x; xnew];
    xold=xnew;
 end
 if (iter >=itmax)
    disp('raggiunto il numero massimo di iterazioni')
 end
 fprintf('\n');

