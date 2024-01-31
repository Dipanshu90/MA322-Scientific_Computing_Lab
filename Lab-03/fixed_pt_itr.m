function [root, itr] = fixed_pt_itr(x0, g, f, tolerance, str, a,b)
    max_itr = 1000;
    x1 = 0;
    itr = 0;
    N = [];
    Error = [];

    fprintf('No. Of Iterations\tApprox. Soln.\t\tError\n');
    while itr < max_itr
        x1 = g(x0);
        err = abs(x1-x0);
        itr = itr + 1;
        N = [N, itr];
        Error = [Error, err];
        fprintf('%d\t\t\t%.15f\t%d\n', itr, x1, err);
        if err < tolerance
            break;
        end
        x0 = x1;
    end
    if itr == max_itr
        root = NaN;
    else 
        root = x1;
    end
    if itr > 1
        figure
        loglog(N, Error, 'LineWidth',2);
        t = strcat('N vs Error Que-',str);
        title(t)
        xlabel('No. of iterations')
        ylabel('Error')

        figure
        fplot(@(x) f(x),[a,b],'LineWidth',2);
        hold on;
        fplot(@(x) 0,[a,b],'LineStyle','--', 'Color',[0.5 0.5 0.5]);
        t = strcat('Function Plot Que-',str);
        title(t)
    end
    fprintf('\nThe required root is: %f\n', root);
    fprintf('The number of iterations performed: %d\n\n', itr);
end