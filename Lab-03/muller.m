function [root,itr] = muller(x0, x1, x2, f, tolerance)
    max_itr = 1000;
    itr = 0;
    N = [];
    N1 = [0, 1, 2];
    Approx_soln = [x0, x1, x2];
    Error = [];
    err = abs(x2-x1);
    
    fprintf('No. Of Iterations\tApprox. Soln.\t\t\tError\n');
    while (abs(f(x2)) >= tolerance || err >= tolerance) && itr <= max_itr
        itr = itr+1;
        % t = f[x2,x1,x0]
        t = (func(f,x2,x1)-func(f,x1,x0))/(x2-x0); 
        w = func(f,x2,x1)+ (x2-x1)*t;
        t1 = (w*w - 4*f(x2)*t)^0.5;
        denominator = w + t1;
        if(abs(w-t1)>abs(denominator)) 
            denominator = w - t1;
        end
        x0 = x1;
        x1 = x2;
        x2 = x2 - 2*f(x2)/denominator;
        err = abs(x1-x2);
        Approx_soln = [Approx_soln,x2];
        Error = [Error, err];
        N = [N, itr];
        N1 = [N1, itr];
        fprintf('%d\t\t\t%d + i%d\t%d\n', itr, real(x2), imag(x2), err);
    end
    if itr == max_itr
        root = NaN;
    else 
        root = x2;
    end
    fprintf('\nThe required root is: %d + i%d\n', real(root), imag(root));
    fprintf('The number of iterations performed: %d\n\n', itr);
end