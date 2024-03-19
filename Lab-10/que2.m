function que2(f, fwd_diff, back_diff, X)
    syms x
    
    f1(x) = diff(f, x);
    f2(x) = diff(f1,x);
    
    actual_err_fwd = zeros(1,2);
    actual_err_back = zeros(1,2);
    
    err_bound = zeros(1,2);
    h = X(2) - X(1);
    
    for i = 1:length(fwd_diff)
        actual_err_fwd(i) = abs(double(subs(f1,x,X(i))) - fwd_diff(i));
        x_vals = linspace(X(i), X(i+1));
        y_vals = (h/2)*abs(double(subs(f2,x,x_vals)));
        err_bound(i) = max(y_vals);
    end
    fprintf('The actual errors in forward differences are:-\n');
    disp(actual_err_fwd)
    
    for i = 1:length(back_diff)
        actual_err_back(i) = abs(double(subs(f1,x,X(i+1))) - back_diff(i));
    end
    fprintf('The actual errors in backward differences are:-\n');
    disp(actual_err_back)
    
    fprintf('The error bound in forward and backward differences are:-\n');
    disp(err_bound)
end