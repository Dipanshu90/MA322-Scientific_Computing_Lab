function que1()
    syms x
    
    fprintf('(a)\n');
    n = 2;
    f = x^2*log(x);
    a = 1; b = 1.5;
    Newton_Cotes(n,f,a,b);
    Gauss_Lobatto(n,f,a,b);
    
    fprintf('(b)\n');
    f = 2/(x^2 - 4);
    a = 0; b = 0.35;
    Newton_Cotes(n,f,a,b);
    Gauss_Lobatto(n,f,a,b);
end