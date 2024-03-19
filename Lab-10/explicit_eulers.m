function max_error = explicit_eulers(a, b, N, alpha, f, actual_f, disp, str)
    syms y t;

    h = (b-a)/N;
    Y = [alpha, zeros(1,N)];
    errs = zeros(1,N);
    actual_y = [alpha, zeros(1,N)];

    for i = 1:N
        Y(i+1) = Y(i) + h * double(subs(f, {y,t}, {Y(i),a+(i-1)*h}));
    end
    
    for i = 1:N
        actual_y(i+1) = double(subs(actual_f, t, a+i*h));
        errs(i+1) = abs(Y(i+1) - actual_y(i+1));
    end
    
    if disp == 1
        figure;
        plot(a:h:b, actual_y, a:h:b, Y, 'Linewidth', 2);
        title(strcat('Actual solution and Approximations Plot for', str));
        xlabel('t')
        ylabel('y(t)');
        legend('Actual', 'Approximation');
        hold off;
    
        figure;
        plot(a:h:b, errs, 'Linewidth', 2);
        title(strcat('Absolute Errors Plot (Approx - Actual) for', str));
        xlabel('t')
        ylabel('yi(t) - y(t)');
        hold off;
    
        fprintf('t\t\t\tApproximation\t\tExact\t\t\tError(|Exact - Approx.|)\n');
        for i = 1:N+1
            fprintf('%.6f\t\t%.6f\t\t%.6f\t\t%.6f\n',a + (i-1)*h, Y(i), actual_y(i), errs(i));
        end
    end

    max_error = max(errs);
end