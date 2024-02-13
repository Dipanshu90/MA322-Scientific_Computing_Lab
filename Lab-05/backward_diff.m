function p = backward_diff(X,y)
    syms x

    h = X(2) - X(1);
    
    n = length(y);
    diff_table = zeros(n, n);
    diff_table(:,1) = y'; 
    
    for j = 2:n
        for i = j:n
            diff_table(i,j) = diff_table(i,j-1) - diff_table(i-1,j-1);
        end
    end

    fprintf('The Backward Difference Table will be:-\n');
    for i = 1:n
        for j = 1:n
            fprintf('%.3e\t', diff_table(i,j));
        end
        fprintf('\n');
    end
    fprintf('\n');

    s = (x - X(n)) / h;
    
    p(x) = y(n) + x - x;
    multiplier = 1;
    for i = 1:n-1
        multiplier = multiplier * (s + (i-1)) / i;
        p(x) = p(x) + diff_table(n, i+1) * multiplier;
    end
end