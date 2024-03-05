function [n,h] = comp_trap_rule(f,a,b,tol,str)
    syms x
    
    fprintf(strcat(str, '\n'));
    actual_res = double(int(f,a,b));
    
    n = 1;
    h = b-a;
    err = h;
    while 1
        h = (b-a)/n;
        X = a:h:b;
        l = length(X);
        
        val = double(subs(f,x,X(1))) + double(subs(f,x,X(end)));
        if n > 2
            for i = 2:l-1
               val = val + 2 * double(subs(f,x,X(i)));
            end
        end
        val = val*h/2;
        
        err = abs(val - actual_res);
        if err < tol
            break 
        end
        n = n+1;
    end
    
    fprintf('Composite Trapezoidal Rule:- The value of n = %d and h = %d\n', n, h);
    fprintf('The error value is:- %d\n\n', err);
end