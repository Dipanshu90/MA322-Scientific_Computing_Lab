function que3b(N, var, str)
    maxerror = zeros(1, length(N));
    z = 1;
    a = 0; b = 1;
    BC = @(x, y) exp(x).*cos(y);
    f = @(x,y) exp(x).*(2*cos(y) - sin(y));

    for n = N
        h = (b - a)/n;
        k = h;

        x = a : h : b;
        y = a : k : b;

        U = zeros(n+1, n+1);
        Err = zeros(n+1, n+1);
    
        U(:, 1) = BC(x(1), y);
        U(:, end) = BC(x(end), y);
        U(1, :) = BC(x, y(1));
        U(end, :) = BC(x, y(end));
    
        max_itr = 1000;

        for k = 1:max_itr
            U_old = U;
            for i = 2:n
                for j = 2:n
                    U(i, j) = ((1 / (h ^ 2)) * (U_old(i + 1, j) + U_old(i - 1, j) + U_old(i, j - 1) + U_old(i, j + 1)) + (1 / h) * (U_old(i + 1, j) + U_old(i, j + 1)));
                    U(i, j) = U(i, j) - f(x(j), y(i));
                    U(i, j) = U(i, j) / ((4 / (h ^ 2)) + (2 / h) - 1);
                end
            end
        end
        
        for i = 2:n
            for j = 2:n
                Err(i, j) = abs(U(i, j) - BC(x(j),y(i)));
            end
        end

        if var == n
            U
            Err
        
            [X,Y] = meshgrid(x,y);
            figure
            mesh(X,Y,U,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
            title(strcat('Surface and Contour plots of approximations for ', str));
            hold on;
            contour(X,Y,U,'FaceColor','auto', 'FaceAlpha',0.6, 'EdgeColor','black');
            hold off;
            saveas(gcf, strcat(str, '_approx.png'));
            
        
            figure
            mesh(X,Y,Err,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
            title(strcat('Surface plot of Errors for ', str));
            hold off;
            saveas(gcf, strcat(str, '_err.png'));
            
        
            x = a : 0.005 : b;
            y = a : 0.005 : b;
        
            [X,Y] = meshgrid(x,y);
            M = BC(X,Y);
        
            figure
            mesh(X,Y,M,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
            title(strcat('Surface and Contour plots of exact solutions for ', str));
            hold on;
            contour(X,Y,M,'FaceColor','auto', 'FaceAlpha',0.6, 'EdgeColor','black');
            hold off;
            saveas(gcf, strcat(str, '_actual.png'));
            
        end
        maxerror(z) = max(max(Err));
        z = z+1;
    end

    delx = (b - a)./N;

    figure
    loglog(delx, maxerror, 'LineWidth', 2);
    title(strcat('loglog plot for ', str));
    hold off;
    saveas(gcf, strcat(str, '_loglog.png'));
    
end