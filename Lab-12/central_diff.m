function max_error = central_diff(a, b, N, alpha, f, actual_f, disp, str)
    h = (b-a)/N;
    Y = [alpha, actual_f(a+h), zeros(1,N-1)];
    errs = zeros(1,N+1);
    actual_y = [alpha, zeros(1,N)];

    for i = 2:N
        Y(i+1) = Y(i-1) + 2 * h * f(Y(i),a+(i-1)*h);
    end
    
    for i = 1:N
        actual_y(i+1) = actual_f(a+i*h);
        errs(i+1) = abs(Y(i+1) - actual_y(i+1));
    end
    
    if disp == 1
        figure;
        plot(a:h:b, actual_y, a:h:b, Y, 'Linewidth', 2);
        title(strcat('Actual solution and Approximations Plot for', str, ' h= ', num2str(h)));
        xlabel('t')
        ylabel('y(t)');
        legend('Actual', 'Approximation');
        hold off;
    
        figure;
        plot(a:h:b, errs, 'Linewidth', 2);
        title(strcat('Absolute Errors Plot (Approx - Actual) for', str, ' h= ', num2str(h)));
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