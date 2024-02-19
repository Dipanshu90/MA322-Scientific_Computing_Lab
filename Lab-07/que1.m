function que1()
    syms x
    
    fun = @(x) log(exp(x) + 2);
    
    X = [-1, -0.5, 0, 0.5];
    f = [0.86199480, 0.95802009, 1.0986123, 1.2943767];
    f_dash = [0.15536240, 0.23269654, 0.33333333, 0.45186776];
    
    [H(x), Q] = Hermite_interpolation(X,f,f_dash);
    
    figure
    fplot(@(x) fun(x), [-5, 5],'Linewidth', 2);
    hold on;
    fplot(@(x) H(x), [-5, 5],'Linewidth', 2);
    hold on;
    for i=1:4
       plot(X(i), f(i),'kd', 'Linewidth', 4);
       hold on;
    end
    legend('f(x)', 'H(x)');
    title('Function plot Que - 1');
    hold off;
    
    fprintf('H(0.25) = %.10f\n', double(subs(H,x,0.25)));
    fprintf('f(0.25) = %.10f\n', fun(0.25));
    
    fprintf('Absolute Error: - %d\n\n', abs(fun(0.25) - double(subs(H,x,0.25))));
end