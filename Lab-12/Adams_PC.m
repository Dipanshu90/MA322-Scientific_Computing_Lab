function max_error = Adams_PC(a, b, var, N, alpha, f, actual_f, disp, str)
    h = (b-a)/N;
    
    if var == 1
        Y = Runge_Kutta(a, 3, h, alpha, f, 0);
    elseif var == 2
        Y = Runge_Kutta(a, 3, h, alpha, f, 1);
    else
        t1 = a + h;
        t2 = t1 + h;
        t3 = t2 + h;
        Y = [alpha, actual_f(t1), actual_f(t2), actual_f(t3)];
    end
    Y = [Y, zeros(1, N-3)];
    errs = zeros(1, N+1);
    actual_y = [alpha, zeros(1, N)];
    
    for i = 4:N
        t_i1 = a + i*h;
        ti = t_i1 - h;
        ti_1 = ti - h;
        ti_2 = ti_1 - h;
        ti_3 = ti_2 - h;
        Y(i+1) = Y(i) + h*(55 * f(Y(i), ti) - 59 * f(Y(i-1), ti_1) + 37 * f(Y(i-2), ti_2) - 9 * f(Y(i-3), ti_3))/24;
        Y(i+1) = Y(i) + h*(9 * f(Y(i+1), t_i1) + 19 * f(Y(i), ti) - 5 * f(Y(i-1), ti_1) + f(Y(i-2), ti_2))/24;
    end
    
    for i = 1:N
        actual_y(i+1) = actual_f(a+i*h);
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
            fprintf('%.6f\t\t%.7f\t\t%.7f\t\t%.7f\n',a + (i-1)*h, Y(i), actual_y(i), errs(i));
        end
    end
    
    max_error = max(errs);
end