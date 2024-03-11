function que2()
    syms x
    
    fprintf('(a)\n');
    for n = 2:5
        a = 0; b = pi/4;
        f = exp(3*x)*sin(2*x);
        Newton_Cotes(n,f,a,b);
        Gauss_Lobatto(n,f,a,b);
    end
    fprintf('(b)\n');
    for n = 2:5
        a = 1; b = 1.6;
        f = 2*x/(x^2 - 4);
        Newton_Cotes(n,f,a,b);
        Gauss_Lobatto(n,f,a,b);
    end
end