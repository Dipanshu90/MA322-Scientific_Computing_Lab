function que3()
    syms x
    
    f = @(x) 1/(1+x^2);
    x0 = double(1 + sqrt(10));
    Errors = [];
    N = [1:10];
    
    for i = 1:10
        h = 10/i;
        X = [];
        y = [];
        
        for j = 0:i
            X = [X, -5 + j*h];
            y = [y, f(X(end))];
        end
        
        p(x) = lagrange_interpolation(X, y, x0);
    end
    
    fprintf('Exact value of f(%f) is :- %.10f\n\n',x0, f(x0));
    
    for i = 1:10
        h = 10/i;
        X = [];
        y = [];
        
        for j = 0:i
            X = [X, -5 + j*h];
            y = [y, f(X(end))];
        end
        
        [diff_mat, p(x)] = forward_diff(X,y,0);
        fprintf('The approximate value of f(%f) by forward difference is: %.8f\n', x0, double(subs(p,x,x0)));
        % figure
        % fplot(@(x) f(x), [-5,5], 'Linewidth', 2);
        % hold on;
        % fplot(@(x) p(x), [-5,5], 'Linewidth', 2);
        % legend('f(x)', 'p(x)');
        % title('Plot for interpolation');
        % hold off;
        Errors = [Errors, abs(f(x0) - double(subs(p,x,x0)))];
    end
    
    figure
    plot(N, Errors, 'Linewidth', 2);
    title('N vs Error plot');
    hold off;
    
    fprintf('Exact value of f(%f) is :- %.10f\n\n',x0, f(x0));
    
    for i = 1:10
        h = 10/i;
        X = [];
        y = [];
        
        for j = 0:i
            X = [X, -5 + j*h];
            y = [y, f(X(end))];
        end
        
        [diff_mat, p(x)] = backward_diff(X,y,0);
        fprintf('The approximate value of f(%f) by backward difference is: %.8f\n', x0, double(subs(p,x,x0)));
    end
    
    fprintf('Exact value of f(%f) is :- %.10f\n',x0, f(x0));
end