function idx = find_index(X, x0)
    n = length(X);
    idx = 1;
    for i=1:n
        if(X(i) < x0)
            idx = i;
        else
            break;
        end
    end
end