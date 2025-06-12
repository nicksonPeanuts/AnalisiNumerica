
v = 1/sqrt(2);
sigma1 = 4/sqrt(2);
sigma2 = sqrt(2);

V = [0 1 0 0;
      0 0 1 0;
      1 0 0 0;
      0 0 0 1];

S = [sigma1 0;
     0 sigma2;
     0 0;
     0 0];

U = [v -v;
     v  v];

A = V * S * U';

disp(A)
