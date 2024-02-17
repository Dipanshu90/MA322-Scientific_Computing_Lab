function que1()
    syms x
    
    X = [1.0, 1.5, 2.0, 2.5];
    y = [2.7183, 4.4817, 7.3819, 12.1825];
    
    f = @(x) exp(x);
    
    x0 = 2.25;
    
    [diff_mat, p(x)] = forward_diff(X,y,1);
    fprintf('The approximate value of f(2.25) by forward difference is: %.8f\n\n', double(subs(p,x,x0)));

    [diff_mat, p(x)] = backward_diff(X,y,1);
    fprintf('The approximate value of f(2.25) by backward difference is: %.8f\n', double(subs(p,x,x0)));
    
    fprintf('\nThe actual value of f(2.25) is: %.8f\n', f(x0));
end