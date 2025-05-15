function [L, U] = lugauss(A)
    n = size(A, 1);
    U = A;
    L = eye(n);

    for k = 1:n-1
        for i = k+1:n
            % Calcola il moltiplicatore
            L(i,k) = U(i,k) / U(k,k);
            
            % Aggiorna la riga i della matrice U
            U(i,:) = U(i,:) - L(i,k) * U(k,:);
        end
    end
end
