function max_error = implicit_eulers(a, b, N, alpha, f, actual_f, disp, str)
    %syms y t

    h = (b-a)/N;
    Y = [alpha, zeros(1,N)];
    errs = zeros(1,N+1);
    actual_y = [alpha, zeros(1,N)];
    max_itr = 200;
    tol = 1e-6;

    for i = 1:N
        Y(i+1) = 0.5;
        for j = 1:max_itr
            %next_val = Y(i) + h * double(subs(f, {y,t}, {Y(i+1), a+i*h}));
            next_val = Y(i) + h * f(Y(i+1), a+i*h);
            if abs(next_val - Y(i+1)) < tol
                Y(i+1) = next_val;
                break;
            end
            Y(i+1) = next_val;
        end
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
            fprintf('%.6f\t\t%.7f\t\t%.7f\t\t%.7f\n',a + (i-1)*h, Y(i), actual_y(i), errs(i));
        end
    end

    max_error = max(errs);
end