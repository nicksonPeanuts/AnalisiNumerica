sigma = [0, 0.06, 0.14, 0.25, 0.31, 0.47, 0.60];
epsilon = [0, 0.08, 0.14, 0.20, 0.23, 0.25, 0.28];


a1 = polyfit(sigma, epsilon, 1);

xx = linspace(sigma(1),sigma(end));
yy1 = polyval(a1,xx);

err1vec = (polyval(a1,x)-y).^2;
err1 = sqrt(sum(err1vec))

prevrettaMQ=polyval(a1,xestrap)

% Polinomio di approssimazione ai minimi quadrati di grado 2 
a2 = polyfit(sigma,epsilon,2);
xx = linspace(sigma(1),sigma(end));
yy2 = polyval(a2,xx);

err2vec = (polyval(a2,sigma)-epsilon).^2;
err2 = sqrt(sum(err2vec))
norm(polyval(a2,x)-y)
prevparab=polyval(a2,sigma(end))

% GRAFICO
plot(sigma,epsilon,'mo','markersize',6); hold on;
plot(xx,yy1,'b-','Linewidth',2); % retta di approssimazione ai minimi quadrati
plot(xx,yy2,'r-','Linewidth',2); % parabola Min. quadrati%
plot(xestrap,yvero,'g*','markersize',10); % punto vero
legend('punti','retta MQ','parabola MQ',...
'valore vero','Location','northwest'); hold off;