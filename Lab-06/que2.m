function que2()
    syms x
    
    % part (a)
    X = [0, 0.25];
    y = [1, 1.64872];
     
    x0 = 0.43;
    
    [diff_mat, p(x)] = forward_diff(X,y,1);
    fprintf('The approximate value of f(0.43) by forward difference of degree 1 is: %.8f\n\n', double(subs(p,x,x0)));
    fun_plot(p, X(1)-0.5, X(end)+0.5, x0);
    
    X = [X, 0.5];
    y = [y, 2.71828];
    [diff_mat, p(x)] = update_diff(diff_mat, X, y, p);
    fprintf('The approximate value of f(0.43) by forward difference of degree 2 is: %.8f\n\n', double(subs(p,x,x0)));
    fun_plot(p, X(1)-0.5, X(end)+0.5, x0);
    
    X = [X, 0.75];
    y = [y, 4.48169];
    [diff_mat, p(x)] = update_diff(diff_mat, X, y, p);
    fprintf('The approximate value of f(0.43) by forward difference of degree 3 is: %.8f\n\n', double(subs(p,x,x0)));
    fun_plot(p, X(1)-0.5, X(end)+0.5, x0);
    
    % part (b)
    X = [-0.75, -0.5];
    y = [-0.07181250, -0.02475000];
     
    x0 = double(-1/3);
    
    [diff_mat, p(x)] = forward_diff(X,y,1);
    fprintf('The approximate value of f(-1/3) by forward difference of degree 1 is: %.8f\n\n', double(subs(p,x,x0)));
    fun_plot(p, X(1)-0.5, X(end)+0.5, x0);
    
    X = [X, -0.25];
    y = [y, 0.33493750];
    [diff_mat, p(x)] = update_diff(diff_mat, X, y, p);
    fprintf('The approximate value of f(-1/3) by forward difference of degree 2 is: %.8f\n\n', double(subs(p,x,x0)));
    fun_plot(p, X(1)-0.5, X(end)+0.5, x0);
    
    X = [X, 0];
    y = [y, 1.10100000];
    [diff_mat, p(x)] = update_diff(diff_mat, X, y, p);
    fprintf('The approximate value of f(-1/3) by forward difference of degree 3 is: %.8f\n\n', double(subs(p,x,x0)));
    fun_plot(p, X(1)-0.5, X(end)+0.5, x0);
end