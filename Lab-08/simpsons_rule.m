function simpsons_rule(f,a,b,str)
    syms x
    
    res = (b-a) * (double(subs(f,x,a)) + 4*double(subs(f,x,(a+b)/2)) + double(subs(f,x,b)))/6;
    actual_res = double(int(f, a, b));
    
    fprintf(strcat(str,'\n'));
    fprintf('The approximation of given integral using simpsons rule is %f.\n', res);
    fprintf('The error in approximation is (|Approx - Actual|):- %d.\n\n', abs(actual_res-res));
end