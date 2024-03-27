function max_error = Runge_Kutta(order, a, b, N, alpha, f, actual_f, disp, str, c2)
    syms y t;
    
    h = (b-a)/N;
    Y = [alpha, zeros(1,N)];
    errs = zeros(1,N);
    actual_y = [alpha, zeros(1,N)];
    
    if order == 2
        w2 = 1/(2*c2);
        w1 = 1 - w2;

        for i = 1:N
            K1 = h * f(Y(i), a + (i-1)*h);
            K2 = h * f(Y(i) + c2*K1, a + (i-1)*h + c2*h);
            Y(i+1) = Y(i) + w1*K1 + w2*K2;
        end
    elseif order == 4
        if c2 == 0
            c2 = 1/2; c3 = 1/2; c4 = 1;
            w1 = 1/6; w2 = 2/6; w3 = 2/6; w4 = 1/6;
            a21 = 1/2;
            a31 = 0; a32 = 1/2;
            a41 = 0; a42 = 0; a43 = 1;
        else
            c2 = 1/3; c3 = 2/3; c4 = 1;
            w1 = 1/8; w2 = 3/8; w3 = 3/8; w4 = 1/8;
            a21 = 1/3;
            a31 = -1/3; a32 = 1;
            a41 = 1; a42 = -1; a43 = 1;
        end
        
        for i = 1:N
            K1 = h * f(Y(i), a + (i-1)*h);
            K2 = h * f(Y(i) + a21*K1, a + (i-1)*h + c2*h);
            K3 = h * f(Y(i) + a31*K1 + a32*K2, a + (i-1)*h + c3*h);
            K4 = h * f(Y(i) + a41*K1 + a42*K2 + a43*K3, a + (i-1)*h + c4*h);
            Y(i+1) = Y(i) + w1*K1 + w2*K2 + w3*K3 + w4*K4;
        end
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
            fprintf('%.6f\t\t%.6f\t\t%.6f\t\t%.6f\n',a + (i-1)*h, Y(i), actual_y(i), errs(i));
        end
    end
    
    max_error = max(errs);
end