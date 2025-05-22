% SEQUENZE CONVERGENTI "PI GRECO".

% METODO 1.

s(1)=1; u(1)=1;
s(2)=1.25; u(2)=s(2);
for n=2:40
    s(n+1)=s(n)+(n+1)^(-2);
    u(n+1)=sqrt(6*s(n+1));
    fprintf('\n \t [SEQ.1][INDEX]: %3.0f', n);
    fprintf(' [REL.ERR]: %2.2e', abs(u(n+1)-pi)/pi);
end
rel_err_u=abs(u-pi)/pi;


fprintf('\n');

% METODO 2.
format long
z(1)=1; 
z(2)=2;
for n=2:40
    c=(4^(1-n)) * (z(n))^2; inner_sqrt=sqrt(1-c);
    z(n+1)=(2^(n-0.5))*sqrt( 1-inner_sqrt );
    fprintf('\n \t [SEQ.2][N]: %3.0f', n);
    fprintf(' [REL.ERR]: %2.2e', abs(z(n+1)-pi)/pi);
end
rel_err_z=abs(z-pi)/pi;

fprintf('\n');

% METODO 3.
y(1)=1; 
y(2)=2;
for n=2:40
    num=(2^(1/2)) * abs(y(n)); 
    c=(4^(1-n)) * (y(n))^2;
    inner_sqrt=sqrt(1-c);
    den=sqrt( 1+inner_sqrt );
    y(n+1)=num/den;
    fprintf('\n \t [SEQ.3][N]: %3.0f',n);
    fprintf(' [REL.ERR]: %2.2e', abs(y(n+1)-pi)/pi);
end
fprintf('\n');
rel_err_y=abs(y-pi)/pi;


% SEMILOGY PLOT.
semilogy(1:length(u),rel_err_u,'k.'); hold on;
semilogy(1:length(z),rel_err_z,'m+'); 
semilogy(1:length(y),rel_err_y,'ro'); hold off

