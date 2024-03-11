function Gauss_Legendre(n,f,a,b)
    syms x
    
    roots = [];
    coeff = [];
    
    if n == 2
        roots = [0.5773502692, -0.5773502692];
        coeff = [1,1];
    elseif n == 3
        roots = [0.7745966692, 0, -0.7745966692];
        coeff = [0.5555555556, 0.8888888889, 0.5555555556];
    elseif n == 4
        roots = [0.8611363116, 0.3399810436, -0.3399810436, -0.8611363116];
        coeff = [0.3478548451, 0.6521451549, 0.6521451549, 0.3478548451];
    elseif n == 5
        roots = [0.9061798459, 0.5384693101, 0, -0.5384693101, -0.9061798459];
        coeff = [0.2369268850, 0.4786286705, 0.5688888889, 0.4786286705, 0.2369268850];
    elseif n == 6
        roots = [-0.9324695142031521, -0.6612093864662645, -0.2386191860831969, 0.2386191860831969, 0.6612093864662645, 0.9324695142031521];
        coeff = [0.1713244923791704, 0.3607615730481386, 0.4679139345726910, 0.4679139345726910, 0.3607615730481386, 0.1713244923791704];
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
    
    fprintf('The approximated integral by Gauss-Legendre quadrature for n = %d is %f\n', n, res);
    fprintf('The actual integral = %f\nThe error in approimation is %d\n\n', actual_res, err);
end