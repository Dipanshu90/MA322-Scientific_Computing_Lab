function [root, itr] = Newton(x0, f, f_dash, e,str)
    itr = 0;
    N = [];
    N1 = [0];
    Approx_soln = [x0];
    Error = [];
    
    v = f(x0);
    x1 = x0;
    if abs(v) < e
        root = x1;
        fprintf('No. Of Iterations\tApprox. Soln.\tError\n');
        fprintf('%d\t\t\t%f\t0\n', itr, root);
    else
        fprintf('No. Of Iterations\tApprox. Soln.\t\tError\n');
        while abs(v) >= e
            x1 = x0 - v/f_dash(x0);
            v = f(x1);
            err = abs(x1-x0);
            x0 = x1;
            itr = itr + 1;
            fprintf('%d\t\t\t%.15f\t%d\n', itr, x0, err);
            N = [N, itr];
            N1 = [N1, itr];
            Approx_soln = [Approx_soln, x0];
            Error = [Error, err];
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
    root = x1;
    fprintf('\nThe required root is: %f\n', root);
    fprintf('The number of iterations performed: %d\n\n', itr);
end