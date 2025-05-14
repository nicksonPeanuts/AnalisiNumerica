%-------------------------------------------------------------------------
% SCRIPT per modellizare la crescita della popolazione degli 
% Stati Uniti di America. 
% A partire da misurazioni del numero di abitanti negli anni 
% dal 1900 al 2000.
% A partire da questi dati si vuole estimare il numero di abitanti
% nell'anno 2010, e confrontarlo con il valore rilevato nel censimento
% effettuato in tale anno che era di 308.745.538 abitanti.
%-------------------------------------------------------------------------
% anni in cui sono stati effettuate le misurazioni
x= 1900:10:2000;
% Dati in milioni di abitanti
y=[75.995 91.972  105.711  123.203 131.669 150.697 179.323 203.212 226.505 249.633 281.422];
yvero= 308.745; % milioni di abitanti
xestrap=2010;

% Polinomio di approssimazione ai minimi quadrati di grado 1 (retta) 
a1 = polyfit(x,y,1);
xx = linspace(x(1),xestrap);
yy1 = polyval(a1,xx);

err1vec = (polyval(a1,x)-y).^2;
err1 = sqrt(sum(err1vec))

prevrettaMQ=polyval(a1,xestrap)

% Polinomio di approssimazione ai minimi quadrati di grado 2 
a2 = polyfit(x,y,2);
xx = linspace(x(1),xestrap);
yy2 = polyval(a2,xx);

err2vec = (polyval(a2,x)-y).^2;
err2 = sqrt(sum(err2vec))
%norm(polyval(a2,x)-y)
prevparab=polyval(a2,xestrap)

% GRAFICO
plot(x,y,'mo','markersize',6); hold on;
plot(xx,yy1,'b-','Linewidth',2); % retta di approssimazione ai minimi quadrati
plot(xx,yy2,'r-','Linewidth',2); % parabola Min. quadrati
plot(xestrap,yvero,'g*','markersize',10); % punto vero
legend('punti','retta MQ','parabola MQ',...
'valore vero','Location','northwest'); hold off;

