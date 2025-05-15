function ys = lagrange(x,y,xs)
%------------------------------------------------
% Calcola l'i-esimo pol. elementare di Lagrange
% sul punto target xs, e lo mette in l
%------------------------------------------------
% x = nodi di interpolazione
% y = ordinate dei punti di interpolazione
% i = indice del polinomio elementare
%
% l = valore di l_i(xs)
%------------------------------------------------
n = length(x)-1;
ys = 0;
for i=1:n+1
   x1=setdiff(x,[x(i)]);
   l=prod(xs-x1)/prod(x(i)-x1);
   ys = ys + y(i)*l;
end
