function l = fun(i, X)
    syms x
    l(x) = x/x;

    for j = 1:length(X)
        if j ~= i
            l(x) = l(x)*(x-X(j))/double(X(i)-X(j));
        end
    end
end