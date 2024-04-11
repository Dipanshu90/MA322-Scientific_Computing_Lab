function max_error = finite_difference_1(a, b_, alpha, beta, N, p, q, r, actual_f, disp_var, str, method)
    h = (b_-a)/(N+1);

    w0 = alpha; w_end = beta;

    A = zeros(N, N);
    b = zeros(N, 1);
    
    for i = 1:N
        for j = (i-1):(i+1)
            if (j >= 1 && j <= N)
                x = a + j*h;
                if j == i-1
                    if method == 1
                        A(j, i) = -1 + h*p(x);
                    elseif method == 2
                        A(j, i) = -1 + 0.5*h*p(x);
                    else
                        A(j, i) = -1;
                    end
                elseif j == i
                    if method == 1
                        A(j, i) = 2 + h^2*q(x) - h*p(x);
                    elseif method == 2
                        A(j, i) = 2 + h^2*q(x);
                    else
                        A(j, i) = 2 + h^2*q(x) + h*p(x);
                    end
                else
                    if method == 1
                        A(j, i) = -1;
                    elseif method == 2
                        A(j, i) = -1 - 0.5*h*p(x);
                    else
                        A(j, i) = -1 - h*p(x);
                    end
                end
            end
        end
    end

    % disp(A);

    for i = 1:N
        x = a + i*h;
        b(i) = -h^2*r(x);

        if i == 1
            if method == 1
                b(i) = b(i) + w0;
            elseif method == 2
                b(i) = b(i) + (1 + 0.5*h*p(x))*w0;
            else
                b(i) = b(i) + (1 + h*p(x))*w0;
            end
        elseif i == N
            if method == 1
                b(i) = b(i) + (1 - h*p(x))*w_end;
            elseif method == 2
                b(i) = b(i) + (1 - 0.5*h*p(x))*w_end;
            else
                b(i) = b(i) + w_end;
            end
        end
    end

    % disp(b);

    w = A \ b;

    w_final = [w0, w.', w_end];

    % disp(w_final);

    errs = zeros(1, N+2);
    actual_y = [alpha, zeros(1, N+1)];

    for i = 1:N+1
        actual_y(i+1) = actual_f(a+i*h);
        errs(i+1) = abs(w_final(i+1) - actual_y(i+1));
    end

    if disp_var == 1
        figure;
        plot(a:h:b_, actual_y, a:h:b_, w_final, 'Linewidth', 2);
        title(strcat('Actual solution and Approximations Plot for', str));
        xlabel('t')
        ylabel('y(t)');
        legend('Actual', 'Approximation');
        hold off;

        figure;
        plot(a:h:b_, errs, 'Linewidth', 2);
        title(strcat('Absolute Errors Plot (Approx - Actual) for', str));
        xlabel('t')
        ylabel('|yi(t) - y(t)|');
        hold off;

        fprintf('For h = %d\nt\t\t\tApproximation\t\tExact\t\t\tError(|Exact - Approx.|)\n', h);
        for i = 1:N+2
            fprintf('%.6f\t\t%.7f\t\t%.7f\t\t%.7f\n',a + (i-1)*h, w_final(i), actual_y(i), errs(i));
        end
        fprintf('\n');
    end

    max_error = max(errs);
end