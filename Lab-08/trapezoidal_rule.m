function trapezoidal_rule(f,a,b,str)
    syms x
    
    res = (b-a) * (double(subs(f,x,a)) + double(subs(f,x,b)))/2;
    actual_res = double(int(f, a, b));
    
    fprintf(strcat(str,'\n'));
    fprintf('The approximation of given integral using trapezoidal rule is %f.\n', res);
    fprintf('The error in approximation is (|Approx - Actual|):- %d.\n\n', abs(actual_res-res));
end
