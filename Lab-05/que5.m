function que5()
    syms x

    % lagrange method
    X = [0, 0.1, 0.3, 0.6, 1];
    y = [-6, -5.89483, -5.65014, -5.17788, -4.28172];
    x0 = 0.2;

    lagrange_interpolation(X,y,x0, 5);

    % divided differences
    [p(x), diff_mat] = divided_diff(X,y);

    fprintf('f(%f) by divided differnce is :- %.10f\n',x0, double(subs(p,x,x0)));

    % after adding f(1.1) = -3.99583
    %lagrange method
    X = [0, 0.1, 0.3, 0.6, 1, 1.1];
    y = [-6, -5.89483, -5.65014, -5.17788, -4.28172, -3.99583];
    fprintf('-------------------------------------------------------------------');
    fprintf('\nAfter Adding f(1.1) = -3.99583\n\n');
    lagrange_interpolation(X,y,x0, 5);

    % divided differences
    n = size(diff_mat,2);
    %temp = y(end);
    %resizing the difference matrix
    diff_mat = [diff_mat, zeros(n,1)];
    diff_mat = [diff_mat; zeros(1,n+1)];
    diff_mat(n+1,1) = y(end);

    for k = 1:n
        j=k+1;
        i=n+2-j;
        num = diff_mat(i+1,j-1) - diff_mat(i,j-1);
        den = (X(i+j-1) - X(i));
        diff_mat(i, j) = num/den;
    end
    
    p(x) = p(x) + diff_mat(1,n+1)*prod(x-X(:,1:n));
    fprintf('The Updated Divided Difference Table can be given as:-\n');
    for i=1:n+1
       for j=1:n+1
           fprintf('%.3e\t', diff_mat(i,j));
       end
       fprintf('\n');
    end
    fprintf('\n');
    fprintf('f(%f) by divided differnce is :- %.10f\n',x0, double(subs(p,x,x0)));
end