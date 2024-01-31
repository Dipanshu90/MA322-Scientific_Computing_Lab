function [root, itr] = fixed_pt_itr(x0, g, tolerance)
    max_itr = 1000;
    x1 = 0;
    itr = 0;
    N = [];
    N1 = [0];
    Approx_soln = [x0];
    Error = [];

    fprintf('No. Of Iterations\tApprox. Soln.\t\tError\n');
    while itr < max_itr
        x1 = g(x0);
        err = abs(x1-x0);
        itr = itr + 1;
        N = [N, itr];
        N1 = [N1, itr];
        Approx_soln = [Approx_soln, x1];
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
    fprintf('\nThe required root is: %f\n', root);
    fprintf('The number of iterations performed: %d\n\n', itr);
end