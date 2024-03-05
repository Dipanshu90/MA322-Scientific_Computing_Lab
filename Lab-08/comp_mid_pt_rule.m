function comp_mid_pt_rule(f,a,b,tol,str)
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
        
        val = 0;
        for i = 1:(l-1)
            val = val + h * double(subs(f,x,(X(i)+X(i+1))/2));
        end
        
        err = abs(val - actual_res);
        if err < tol
            break 
        end
        n = n+1;
    end
    
    fprintf('Composite Midpoint Rule:- The value of n = %d and h = %d\n', n, h);
    fprintf('The error value is:- %d\n\n', err);
end