function que4b(N, str)
    f = @(x) 0.5 * sin(2 * pi * x) + sin(0.5 * pi * x);
    lbc = @(t) 0;
    rbc = @(t) exp(-1 * (pi ^ 2) * t / 4);
    [U, X, T] = FTCS(1, 1, 0.1, 0.2, 1, f, lbc, rbc);
    
    fprintf('FTCS Scheme:-\n');
    fprintf("Estimated values: \n");
    disp(U);
    
    u = @(x, t) exp(-1 * (pi ^ 2) * t / 4) .* sin(0.5 * pi * x) + 0.5 * exp(-4 * (pi ^ 2) * t) .* sin(2 * pi * x);
    
    U_actual = zeros(length(T), length(X));
    
    for j = 1:length(T)
        for i = 1:length(X)
            U_actual(j, i) = u(X(i), T(j));
        end
    end
    
    fprintf("\nErrors: \n");
    disp(abs(U - U_actual));

    [x,t] = meshgrid(X,T);

    figure
    plot(X, U(end,:), X, U_actual(end, :), 'LineWidth',2);
    title(strcat('Exact and numerical solutions at final time level(FTCS) for ',str));
    legend("Approximations", "Actual");
    hold off;
    saveas(gcf, strcat(str, '_FTCS_final_time.png'));
    

    figure
    mesh(x,t,U,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
    title(strcat('Surface plot of approximations(FTCS) for ', str));
    hold off;
    saveas(gcf, strcat(str, '_FTCS_approx.png'));
    

    X = 0 : 0.005 : 1;
    T = 0 : 0.005 : 1;
    [x,t] = meshgrid(X,T);
    U_actual = u(x,t);

    figure
    mesh(x,t,U_actual,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
    title(strcat('Surface plot of exact solutions for ', str));
    hold off;
    saveas(gcf, strcat(str, '_actual.png'));
    
    
    maxerror = zeros(length(N), 1);
    deltas = zeros(length(N), 1);
    
    for n = 1:length(N)
        [U, X, T] = FTCS(1, 1, 1 / N(n), 0.2, 1, f, lbc, rbc);
   
        U_actual = zeros(length(T), length(X));
    
        for j = 1:length(T)
            for i = 1:length(X)
                U_actual(j, i) = u(X(i), T(j));
            end
        end
    
        U_error = abs(U - U_actual);
        maxerror(n) = max(U_error(:));
        deltas(n) = 1 / n;
    end

    figure
    loglog(deltas, maxerror, 'LineWidth', 2);
    title(strcat('loglog plot(FTCS) for ', str));
    hold off;
    saveas(gcf, strcat(str, '_FTCS_loglog.png'));
    
% --------------------------------------------------------------------------------------- %
    [U, X, T] = BTCS(1, 1, 0.1, 0.2, 1, f, lbc, rbc);
    
    fprintf('BTCS Scheme:-\n');
    fprintf("Estimated values: \n");
    disp(U);
    
    U_actual = zeros(length(T), length(X));
    
    for j = 1:length(T)
        for i = 1:length(X)
            U_actual(j, i) = u(X(i), T(j));
        end
    end
    
    fprintf("\nErrors: \n");
    disp(abs(U - U_actual));

    [x,t] = meshgrid(X,T);

    figure
    plot(X, U(end,:), X, U_actual(end, :), 'LineWidth',2);
    title(strcat('Exact and numerical solutions at final time level(BTCS) for ',str));
    legend("Approximations", "Actual");
    hold off;
    saveas(gcf, strcat(str, '_BTCS_final_time.png'));
    

    figure
    mesh(x,t,U,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
    title(strcat('Surface plot of approximations(BTCS) for ', str));
    hold off;
    saveas(gcf, strcat(str, '_BTCS_approx.png'));
    

    maxerror = zeros(length(N), 1);
    deltas = zeros(length(N), 1);
    
    for n = 1:length(N)
        [U, X, T] = BTCS(1, 1, 1 / N(n), 0.2, 1, f, lbc, rbc);
   
        U_actual = zeros(length(T), length(X));
    
        for j = 1:length(T)
            for i = 1:length(X)
                U_actual(j, i) = u(X(i), T(j));
            end
        end
    
        U_error = abs(U - U_actual);
        maxerror(n) = max(U_error(:));
        deltas(n) = 1 / n;
    end

    figure
    loglog(deltas, maxerror, 'LineWidth', 2);
    title(strcat('loglog plot(BTCS) for ', str));
    hold off;
    saveas(gcf, strcat(str, '_BTCS_loglog.png'));
    
% --------------------------------------------------------------------------------------- %
    [U, X, T] = Crank_Nicolson(1, 1, 0.1, 0.2, 1, f, lbc, rbc);
    
    fprintf('Crank_Nicolson Scheme:-\n');
    fprintf("Estimated values: \n");
    disp(U);
    
    U_actual = zeros(length(T), length(X));
    
    for j = 1:length(T)
        for i = 1:length(X)
            U_actual(j, i) = u(X(i), T(j));
        end
    end
    
    fprintf("\nErrors: \n");
    disp(abs(U - U_actual));

    [x,t] = meshgrid(X,T);

    figure
    plot(X, U(end,:), X, U_actual(end, :), 'LineWidth',2);
    title(strcat('Exact and numerical solutions at final time level(Crank-Nicolson) for ',str));
    legend("Approximations", "Actual");
    hold off;
    saveas(gcf, strcat(str, '_Crank_Nicolson_final_time.png'));
    

    figure
    mesh(x,t,U,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
    title(strcat('Surface plot of approximations(Crank-Nicolson) for ', str));
    hold off;
    saveas(gcf, strcat(str, '_Crank_Nicolson_approx.png'));
    
    
    maxerror = zeros(length(N), 1);
    deltas = zeros(length(N), 1);
    
    for n = 1:length(N)
        [U, X, T] = Crank_Nicolson(1, 1, 1 / N(n), 0.2, 1, f, lbc, rbc);
   
        U_actual = zeros(length(T), length(X));
    
        for j = 1:length(T)
            for i = 1:length(X)
                U_actual(j, i) = u(X(i), T(j));
            end
        end
    
        U_error = abs(U - U_actual);
        maxerror(n) = max(U_error(:));
        deltas(n) = 1 / n;
    end

    figure
    loglog(deltas, maxerror, 'LineWidth', 2);
    title(strcat('loglog plot(Crank-Nicolson) for ', str));
    hold off;
    saveas(gcf, strcat(str, '_Crank_Nicolson_loglog.png'));
    
end