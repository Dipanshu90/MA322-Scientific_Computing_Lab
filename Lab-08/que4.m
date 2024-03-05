function que4()
    h = 0.25;
    
    Y = [10, 8, 7, 6, 5];
    
    res = h*(Y(1) + 2 * (Y(2) + Y(3) + Y(4)) + Y(end)) / 2;
    fprintf('The approximation of given integral using composite trapezoidal rule is %f.\n\n', res);
end