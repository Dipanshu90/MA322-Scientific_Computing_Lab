function que3()
    syms x
    
    % part a
    X = [0, 0.25, 0.5, 0.75];
    y = [1, 1.64872, 2.71828, 4.48169];
    x0 = 0.43;

    fprintf('Part-(a) :- ');
    lagrange_interpolation(X,y,x0, 3);

    % part b
    X = [0.6, 0.7, 0.8, 1];
    y = [-0.17694460, 0.01375227, 0.22363362, 0.65809197];
    x0 = 0.9;

    fprintf('Part-(b) :- ');
    lagrange_interpolation(X,y,x0, 3);
end