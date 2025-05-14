%---------------------------------------------------------
%MINIMI QUADRATI E FILTRAGGIO DEL RUMORE PRESENTE NEI DATI
%---------------------------------------------------------

x=linspace(0,2*pi,1000);

ysin=sin(2*x);  %  valori della funzione sin(2x) in [0,2pi]
ysinpert=ysin+(10^(-1))*randn(size(x));%  valori della funzione perturbata 

% polinomi di approssimazione ai minimi quadrati di grado 1,3,5,7,9
for n=1:2:9
    coeff=polyfit(x,ysinpert,n); % COEFFS. BEST APPROX (B.A.) 
    z=polyval(coeff,x);    % VALORE B.A. NEI NODI "x".
    plot(x,ysinpert,'r.',x,z,'k-',x,ysin,'g-','linewidth',2);
    err2=norm(z-ysin,2); err2p=norm(z-ysinpert,2); % ERRORI IN NORMA 2
    errinf=norm(z-ysin,inf); errinfp=norm(z-ysinpert,inf); % ERRORI IN NORMA INF
    fprintf('\n\t[DEG]:%2.0f',n); 
    fprintf(' [2]:%2.2e %2.2e',err2,err2p); 
    fprintf(' [INF]:%2.2e %2.2e',errinf,errinfp); 
    pause(4);
end
fprintf('\n \n');

