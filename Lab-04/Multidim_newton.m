function Multidim_newton(vals, max_itr, tol, str)
    [f,x,a] = vals();
    err = ones(size(a));
    Errors = [];
    N = [];
    syms(x);

    J = jacobian(f, x);
    H = J \ f; % J \ f = inv(J) * f
        
    i=0;
    fprintf('Itr. No.\t\tApprox Soln.\t\t\tError\n');
    while (i < max_itr) && inf_norm(err) >= tol
        err = a;
        H_val = double(subs(H, x, a));
        b = a - H_val;
        a = b;
        err = abs(err - a);
        Errors = [Errors, err];
        N = [N, i+1];
        fprintf('   %d\t [ ', i+1);
        for p = b
           fprintf('%.10f ', p);
        end
        fprintf('] [ ');
        for p = err
           fprintf('%d ', p);
        end
        fprintf(']\n\n');
        i = i+1;
    end
    %disp(Errors);
    figure
    plot(N, Errors.', 'LineWidth',2.5);
    t = strcat('N vs Error Que-',str);
    title(t);
    legend(string(x.'));
    xlabel('No. of iterations');
    ylabel('Error');
    grid on;
    
    [X1,X2] = meshgrid(linspace(-5,5,100), linspace(-5,5,100));
    
    if strcmp(str, '2(a)') == 1
        figure;
        F_1 = 4*(X1).^2 - (X2).^2;
        mesh(X1,X2,F_1)
        hold on
    
        F_2 = 4*X1.*(X2).^2 - X1 -1;
        mesh(X1,X2,F_2)
        t = strcat('Function plot Que-',str);
        title(t);
        xlabel('x-axis');
        ylabel('y-axis');
        zlabel('f(x,y)');
        grid on;
    end
    if strcmp(str, '2(b)') == 1
        figure;
        F_3 = 1 + (X1).^2 - (X2).^2 + exp(X1).*cos(X2);
        mesh(X1,X2,F_3)
        hold on
    
        F_4 = 2*X1.*X2 + exp(X1).*sin(X2);
        mesh(X1,X2,F_4)
        t = strcat('Function plot Que-',str);
        title(t);
        xlabel('x-axis');
        ylabel('y-axis');
        zlabel('f(x,y)');
        grid on;
    end
end