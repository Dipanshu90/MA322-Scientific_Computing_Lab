function rectangle_rule(f,a,b,str)
    syms x
    
    res = (b-a) * double(subs(f,x,a));
    actual_res = double(int(f, a, b));
    
    fprintf(strcat(str,'\n'));
    fprintf('The approximation of given integral using rectangle rule is %f.\n', res);
    fprintf('The error in approximation is (|Approx - Actual|):- %d.\n\n', abs(actual_res-res));
end