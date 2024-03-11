function Newton_Cotes(n, f, a, b)
    syms x
    
    h = (b-a)/(n-1);

    X = a:h:b;
    W = [];
    if n == 2
        W = [h/2, h/2];
    elseif n == 3
        W = [h/3, 4*h/3, h/3];
    elseif n == 4
        W = [3*h/8, 9*h/8, 9*h/8, 3*h/8];
    elseif n == 5
        W = [14*h/45, 64*h/45, 24*h/45, 64*h/45, 14*h/45];
    end
    
    res = 0;
    for i = 1:length(W)
        res = res + W(i)*double(subs(f,x,X(i)));
    end
    actual_res = int(f,a,b);
    err = double(abs(actual_res - res));
    
    fprintf('The approximated integral by Newton-cotes formula for n = %d is %f\n', n, res);
    fprintf('The actual integral = %f\nThe error in approimation is %d\n\n', actual_res, err);
end