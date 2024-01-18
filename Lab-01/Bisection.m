function [c, itr] = Bisection(a,b,e,f)
    itr = 1;

    u = f(a);
    v = f(b);

    if u*v > 0 
        fprintf('Root is not between %d and %d.', a, b);
    elseif u * v == 0
        if u == 0
            c = a;
        else 
            c = b;
        end
    else
        c = (b-a)/2;
        c = c + a;
        w = f(c);
        while abs(w)>e
            if u*w< 0
                b = c;
                v = w;
            else
                a = c;
                u = w;
            end
            c = (b-a)/2;
            c = c + a;
            w = f(c);
            itr = itr + 1;
        end
    end
    fprintf('The required root is: %f\n', c);
    fprintf('The number of iterations performed: %d\n\n', itr);
end
    