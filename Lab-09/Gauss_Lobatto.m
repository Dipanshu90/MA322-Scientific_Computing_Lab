function Gauss_Lobatto(n,f,a,b)
    syms x
    
    roots = [];
    coeff = [];
    
    if n == 2
        roots = [-1, 1];
        coeff = [1,1];
    elseif n == 3
        roots = [-1, 0, 1];
        coeff = [1/3, 4/3, 1/3];
    elseif n == 4
        roots = [-1, -1/sqrt(5), 1/sqrt(5), 1];
        coeff = [1/6, 5/6, 5/6, 1/6];
    elseif n == 5
        roots = [-1, -sqrt(21)/7, 0, sqrt(21)/7, 1];
        coeff = [1/10, 49/90, 32/45, 49/90, 1/10];
    end
    x_dash = x;
    var = 1;
    
    if (a ~= -1) || (b ~= 1)
        x_dash = ((b-a)*x + a + b)/2;
        var = (b-a)/2;
    end
    
    f_dash = subs(f, x, x_dash)*var;
    
    res = 0;
    for i = 1:length(roots)
        res = res + coeff(i)*double(subs(f_dash, x, roots(i)));
    end
    actual_res = int(f,a,b);
    err = double(abs(actual_res - res));
    
    fprintf('The approximated integral by Gauss-Lobatto quadrature for n = %d is %f\n', n, res);
    fprintf('The actual integral = %f\nThe error in approimation is %d\n\n', actual_res, err);
end