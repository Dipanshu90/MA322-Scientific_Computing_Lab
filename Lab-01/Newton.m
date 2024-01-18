function [root, itr] = Newton(x0, f, f_dash, e)
    itr = 1;
    
    v = f(x0);
    x1 = v;
    if abs(v) < e
        root = v;
    else
        while abs(v) >= e
            x1 = x0 - v/f_dash(x0);
            v = f(x1);
            x0 = x1;
            itr = itr + 1;
        end
    end
    root = x1;
    fprintf('The required root is: %f\n', root);
    fprintf('The number of iterations performed: %d\n\n', itr);
end