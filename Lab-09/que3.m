function que3()
    syms x

    N = [2,4];
    
    fprintf('(a)\n');
    for n = N
        f = exp(x)*sin(x);
        Gauss_Legendre(n, f, -1, 1);
        Gauss_Lobatto(n, f, -1, 1);
    end
    fprintf('(b)\n');
    for n = N
        f = exp(x)*cos(x);
        Gauss_Legendre(n, f, -1, 1);
        Gauss_Lobatto(n, f, -1, 1);
    end
end