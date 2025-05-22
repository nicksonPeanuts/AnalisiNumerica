<<<<<<< HEAD




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
=======
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
>>>>>>> a47da089349b200156fc4d59fb09901c90095a74
        end
    end
end
