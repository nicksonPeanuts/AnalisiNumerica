



function[L,U] = lugauss(A)

    %aggiungere assert per dimensioni matrice
    n = size(A,1);
    U = A;
    L = eye(n);
    %colonna
    for k = 1: n-1
        %riga
        for i = k+1: n
            %coefficiente calcolato ogni volta, valori della matrice L
            L(i,k) = U(i,k)/U(k,k);
            U(i,:) = A(i,:) - L(i,k)*A(k,:); 
        end
    end
end
