function p = lagrange_interpolation(X, y, x0) 
    syms x
    
    p(x) = x-x;
    for i = 1:length(X)
        l(x) = fun(i, X);
        p(x) = p(x) + y(i)*l(x);
    end
    
    fprintf('f(%f) by lagrange method is :- %.10f\n',x0, double(subs(p,x,x0)));

end