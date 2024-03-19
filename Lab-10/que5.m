function que5(a, b, N1, N2, N3, y_dash, y_sol, alpha)
    n1 = length(N1);
    n2 = length(N2);
    str = ' Que-5';

    En = zeros(1,n1);
    E2n = zeros(1,n2);
    Eprint = zeros(1,length(N3));
    for i = 1:n1
        En(i) = explicit_eulers(a, b, N1(i), alpha, y_dash, y_sol, 0, str);
        E2n(i) = explicit_eulers(a, b, N2(i), alpha, y_dash, y_sol, 0, str);
    end
    for i = 1:length(N3)
        fprintf('h = %.2f\n', (b-a)/N3(i));
        Eprint(i) = explicit_eulers(a, b, N3(i), alpha, y_dash, y_sol, 1, strcat(str, ', h=', num2str((b-a)/N3(i))));
        fprintf('\n');
    end
    orders = zeros(1,n2);
    for i = 1:n2
        orders(i) = log2(En(i)/E2n(i));
    end

    % fprintf('\nN-value\tE(N)\t\tOrder\n');
    % for i = 1:length(N1)
    %     fprintf('%d\t\t%d\t\t%d\n',N1(i),En(i),orders(i));
    % end
    
    figure;
    plot(N1, orders, 'LineWidth',2);
    title(strcat('N vs order plot for Que-5'));
    xlabel('N');
    ylabel('Order of Convergence');
    hold off;

    figure;
    loglog(N1, En, 'LineWidth',2);
    title('N vs error (loglog plot) for Que-5');
    xlabel('N');
    ylabel('Error');
    hold off;
end