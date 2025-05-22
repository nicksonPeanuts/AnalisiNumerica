%matrici


%inizializzazione della funzione
f = @(x) 2*x.^2 +log(x) - 1/x;

t = @(x) exp(x)

fplot(t, [-10 10])

%printing funzione
%fplot(f, [0.1  1]);
%hold on;
%plot([0.1 1], [0 0], 'k-');
%fzero(f,0.5)

