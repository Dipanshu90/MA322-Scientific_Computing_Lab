function [diff_mat, p] = update_diff(diff_mat, X, y, p)
    syms x
    
    n = size(diff_mat,2);
    
    diff_mat = [diff_mat, zeros(n,1)];
    diff_mat = [diff_mat; zeros(1,n+1)];
    diff_mat(n+1,1) = y(end);

    for k = 1:n
        j=k+1;
        i=n+2-j;
        diff_mat(i, j) = diff_mat(i+1,j-1) - diff_mat(i,j-1);
    end
    
    h = X(2) - X(1);
    s = (x - X(1)) / h;

    p(x) = y(1) + x - x;
    multiplier = 1;
    for i = 1:n
        multiplier = multiplier * (s - (i-1)) / i;
        p(x) = p(x) + diff_mat(1, i+1) * multiplier;
    end
    
    fprintf('The Updated Divided Difference Table can be given as:-\n');
    for i=1:n+1
       for j=1:n+1
           fprintf('%.3e\t', diff_mat(i,j));
       end
       fprintf('\n');
    end
    fprintf('\n');
end