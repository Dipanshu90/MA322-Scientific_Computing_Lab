function [p, diff_mat] = divided_diff(X,Y)
    syms x

    n = size(X,2);
    diff_mat = zeros(n,n);
    diff_mat(:,1) = Y';

    for j = 2:n
        for i=1:(n-j+1)
            num = diff_mat(i+1, j-1) - diff_mat(i,j-1);
            den = (X(i+j-1) - X(i));
            diff_mat(i,j) = num/den;
        end
    end
    fprintf('The Divided Difference Table can be given as:-\n');
    for i=1:n
       for j=1:n
           fprintf('%.3e\t', diff_mat(i,j));
       end
       fprintf('\n');
    end
    fprintf('\n');

    p(x) = Y(1) + x - x;
    for i=1:n-1
        p(x) = p(x) + prod(x - X(:,1:i))*diff_mat(1,i+1);
    end
end