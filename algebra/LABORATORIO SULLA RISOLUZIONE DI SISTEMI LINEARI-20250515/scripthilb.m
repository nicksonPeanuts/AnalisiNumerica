for n=3:15
    H=hilb(n);
    k=cond(H);
    fprintf('\n \t [N]  %3d       [COND]  %6.4e ',n, k)
end 
fprintf('\n')
