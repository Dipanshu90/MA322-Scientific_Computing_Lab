function que2(a, b, str, N1, y_dash, y_sol, alpha)
    n1 = length(N1);

    En1 = zeros(1,n1);
    En2 = zeros(1,n1);
    En3 = zeros(1,n1);
    for i = 1:n1
        fprintf('Implicit Euler for h = %f\n', (b-a)/N1(i));
        En1(i) = implicit_eulers(a, b, N1(i), alpha, y_dash, y_sol, 1, str);
        fprintf('\nExplicit Euler for h = %f\n', (b-a)/N1(i));
        En2(i) = explicit_eulers(a, b, N1(i), alpha, y_dash, y_sol, 1, str);
        fprintf('\nCentral Difference for h = %f\n', (b-a)/N1(i));
        En3(i) = central_diff(a, b, N1(i), alpha, y_dash, y_sol, 1, str);
        fprintf('\n');
    end
end