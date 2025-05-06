

f = @(x) x.*5 -exp(-x);
a = -1;
b = 2;
tolres = 10^(-15);
tolintv = 10^(-15);
maxit = 100;

fplot(f, [-10 1000]);
hold on;
xx = linspace(-100,100,100);

plot(xx, zeros(size(xx)), 'g-','LineWidth',2);
xline(0, '--k', 'asse y'); %linea verticale tratteggiata nera

[c, iter, sl, wr] = bisezione(a, b, tolintv, tolres, maxit, f);

for k = 1:iter
    fprintf('\n[k] : %3.0f [c] : %15.15f [AMP] : %5.2e [WRES] : %5.2e', k, c(k), sl(k), wr(k));
end

fprintf('\n');
