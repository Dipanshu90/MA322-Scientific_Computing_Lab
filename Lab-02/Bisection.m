function [c, itr] = Bisection(a,b,e,f,str)
    itr = 0;

    u = f(a);
    v = f(b);
    N = [];
    N1 = [0];
    Approx_soln = [];
    Error = [];
    
    if u*v > 0 
        fprintf('Root is not between %d and %d.', a, b);
    elseif u * v == 0
        if u == 0
            c = a;
            fprintf('No. Of Iterations\tApprox. Soln.\tError\n');
            fprintf('0\t\t\t%f\t0\n\n', a);
        else
            c = b;
            fprintf('No. Of Iterations\tApprox. Soln.\tError\n');
            fprintf('0\t\t\t%f\t0\n\n', b);
        end
    else
        c = (b-a)/2;
        c = c + a;
        w = f(c);
        err=c;
        Approx_soln = [Approx_soln, c];
        fprintf('No. Of Iterations\tApprox. Soln.\t\tError\n');
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
            err = abs(err-c);
            itr = itr + 1;
            fprintf('%d\t\t\t%.15f\t%d\n', itr, c, err);
            N = [N, itr];
            N1 = [N1, itr];
            Approx_soln = [Approx_soln, c];
            Error = [Error, err];
            err = c;
        end
        if itr > 1
            figure
            plot(N1, Approx_soln, 'LineWidth',2);
            t = strcat('N vs Solution Plot Que-',str);
            title(t)
            xlabel('No. of iterations')
            ylabel('x_n value')

            figure
            plot(N, Error, 'LineWidth',2);
            t = strcat('N vs Residue Que-',str);
            title(t)
            xlabel('No. of iterations')
            ylabel('Residue')
        end
    end
    fprintf('\nThe required root is: %f\n', c);
    fprintf('The number of iterations performed: %d\n\n', itr);
end
    