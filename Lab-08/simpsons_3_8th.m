function simpsons_3_8th(f,x0,x1,x2,x3,str)
    syms x
    
    h = (x1 - x0);
    res = 3* h * (double(subs(f,x,x0)) + 3*double(subs(f,x,x1)) + 3*double(subs(f,x,x2)) + double(subs(f,x,x3)))/8;
    actual_res = double(int(f, x0, x3));
    
    fprintf(strcat(str,'\n'));
    fprintf('The approximation of given integral using simpsons three-eighth rule is %f.\n', res);
    fprintf('The error in approximation is (|Approx - Actual|):- %d.\n\n', abs(actual_res-res));
    
end