



function[L,U] = lugauss(A)
    n = size(A,1);
    L = diag(n);
    print(L)
    %colonna
    for k = [1, n-1]
        %riga
        for i = [k+1: n]
            %coefficiente calcolato ogni volta, valori della matrice L
            L(i,k) = A(i,k)/A(k,k);
            
        end
    end
end
