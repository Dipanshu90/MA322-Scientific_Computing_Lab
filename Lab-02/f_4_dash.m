function y = f_4_dash(x)
    if x == 0
        y = 0;
    else 
        y = (2 / power(x,3)) * exp(-1 / power(x,2));
    end
end