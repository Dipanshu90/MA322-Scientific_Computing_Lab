function que4()
    syms x
    
    N = [2,4,6];
    
    fprintf('(a)\n');
    for n = N
        f = exp(-x^2);
        Gauss_Legendre(n, f, 0, 1);
    end
    fprintf('(b)\n');
    for n = N
        f = 1/(1+x^2);
        Gauss_Legendre(n, f, -4, 4);
    end
end