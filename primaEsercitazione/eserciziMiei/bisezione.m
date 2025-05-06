function [vc, k, semilunghezza, residuopesato] = bisezione(a, b, tolintv, tolres, maxit, f)
    % Metodo di bisezione per il calcolo di uno zero di f in [a, b]
    
    if b < a
        s = b;
        b = a;
        a = s;
    end

    fa = feval(f, a);
    fb = feval(f, b);

    vc = [];
    semilunghezza = [];
    residuopesato = [];

    if fa == 0
        vc = a;
        k = 0;
        semilunghezza = (b - a) / 2;
        residuopesato = 0;
        return;
    end

    if fb == 0
        vc = b;
        k = 0;
        semilunghezza = (b - a) / 2;
        residuopesato = 0;
        return;
    end

    for index = 1:maxit
        c = (a + b) / 2;
        fc = feval(f, c);

        semilun = (b - a) / 2;
        den = (fb - fa);
        if den == 0
            den = eps;
        end

        w = (b - a) / den;
        wres = abs(fc * w);

        vc = [vc; c];
        semilunghezza = [semilunghezza; semilun];
        residuopesato = [residuopesato; wres];

        if (wres < tolres) || (semilun < tolintv) || (fc == 0)
            k = index;
            fprintf('\n');
            return;
        end

        if sign(fc) == sign(fa)
            a = c;
            fa = fc;
        else
            b = c;
            fb = fc;
        end
    end

    k = maxit;
    fprintf('\n');
end
