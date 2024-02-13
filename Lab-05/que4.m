function que4()
    syms x

    X = [1950, 1960, 1970, 1980, 1990, 2000];
    Y = [151326, 179323, 203302, 226542, 249633, 281422];
    
    [p(x), diff_mat] = divided_diff(X,Y);

    x_test = [1940, 1975, 2020];
    for i=1:length(x_test)
        fprintf('Approximate population in the year %.0f = %.0f\n', x_test(i), double(subs(p, x, x_test(i))));
    end
end