function que3a(N, var, str)
    maxerror = zeros(1, length(N));
    z = 1;
    for n = N
        m = n;
        a1 = 0; b1 = 0.5;
        a2 = 0; b2 = 0.5;
        f11 = @(x) 0; f12 = @(x) 200*x;
        f21 = @(y) 0; f22 = @(y) 200*y;
    
        h = (b1 - a1)/n;
    
        A = zeros(n+1,m+1);
        Err = zeros(n+1,m+1);
        for i = 1:n+1
            A(i, 1) = f21(b2 - (i-1)*h);
            A(i, n+1) = f22(b2 - (i-1)*h);
            A(1, i) = f12(a1 + (i-1)*h);
            A(n+1, i) = f11(a1 + (i-1)*h);
        end
    
        max_itr = 1000;

        for k = 1:max_itr
            A_old = A;
            for i = 2:n
                for j = 2:n
                    A(i, j) = 0.25*(A_old(i-1, j) + A_old(i+1, j) + A_old(i, j-1) + A_old(i, j+1));
                end
            end
        end

        for i = 2:n
            for j = 2:n
                x = a1 + (j-1)*h;
                y = b2 - (i-1)*h;
                Err(i, j) = abs(A(i, j) - 400*x*y);
            end
        end

        if var == n
            x = a1 : h : b1;
            y = b2 : -h : a2;
            A
            Err
        
            [X,Y] = meshgrid(x,y);
            figure
            mesh(X,Y,A,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
            title(strcat('Surface and Contour plots of approximations for ', str));
            hold on;
            contour(X,Y,A,'FaceColor','auto', 'FaceAlpha',0.6, 'EdgeColor','black');
            hold off;
            saveas(gcf, strcat(str, '_approx.png'));
            
        
            figure
            mesh(X,Y,Err,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
            title(strcat('Surface plot of Errors for ', str));
            hold off;
            saveas(gcf, strcat(str, '_err.png'));
            
        
            x = a1 : 0.005 : b1;
            y = b2 : -0.005 : a2;
        
            [X,Y] = meshgrid(x,y);
            M = 400*X.*Y;
        
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

    delx = (b1 - a1)./N;

    figure
    loglog(delx, maxerror, 'LineWidth', 2);
    title(strcat('loglog plot for ', str));
    hold off;
    saveas(gcf, strcat(str, '_loglog.png'));
    
end