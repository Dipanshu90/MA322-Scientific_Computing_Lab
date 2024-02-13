function que2()
    f = @(x) sin(log(x));

    X = [2.0, 2.4, 2.6];
    y = f(X);
    syms x

    p(x) = lagrange_interpolation(X, y, 2.2, 2);

    %finding error bound
    f3 = @(x) abs((3*sin(log(x)) + cos(log(x)))/(x^3));
    phi = @(x) abs((x-2)*(x-2.4)*(x-2.6));
    xInterval = [2, 2.6];
    dx = 0.001;
    X = xInterval(1): dx : xInterval(2);
    m1 = f3(2);
    m2 = phi(2);

    for i = 1:length(X)
        m1 = max(m1, f3(X(i)));
        m2 = max(m2, phi(X(i)));
    end

    fprintf('Theoretical Error bound for que-2 is:- %d\n',f3(2)*phi(2.157)/6);
    fprintf('Computational Error bound for que-2 is:- %d\n',m1*m2/6);

    figure
    fplot(@(x) p(x),[1,3.5],'LineWidth',2);
    hold on;
    fplot(@(x) f(x),[1,3.5],'LineWidth',2);
    xline(2);
    xline(2.6);
    yline(f(2));
    yline(f(2.6));
    legend('p(x)', 'f(x)');
    t = strcat('Function Plot Que-2');
    title(t)

    figure
    fplot(@(x) abs(p(x) - f(x)),[2,2.6],'LineWidth',2);
    t = 'Absolute Error plot for que-2';
    title(t)
end