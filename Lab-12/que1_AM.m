function que1_AM(a, b, str, N1, N2, var1, var2, y_dash, y_sol, alpha)
    n1 = length(N1);
    n2 = length(N2);

    En = zeros(1,n1);
    E2n = zeros(1,n2);
    for i = 1:n1
        if i == var1
            disp = 1;
        else
            disp = 0;
        end
        En(i) = Adams_Moulton(a, b, var2, N1(i), alpha, y_dash, y_sol, disp, str);
        E2n(i) = Adams_Moulton(a, b, var2, N2(i), alpha, y_dash, y_sol, 0, str);
    end
    orders = zeros(1,n2);
    for i = 1:n2
        orders(i) = log2(En(i)/E2n(i));
    end
    
    figure;
    plot(N1, orders, 'LineWidth',2);
    title(strcat('N vs order plot for', str));
    xlabel('N');
    ylabel('Order of Convergence');
    hold off;

    figure;
    loglog(N1, En, 'LineWidth',2);
    title(strcat('N vs error (loglog plot) for', str));
    xlabel('N');
    ylabel('Error');
    hold off;
    fprintf('\n');
end