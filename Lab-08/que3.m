function que3()
    syms x
    
    f = 4 / (1+x^2);
    
    rectangle_rule(f,0,1,'3(a)');
    
    mid_pt_rule(f,0,1,'3(b)');
    
    trapezoidal_rule(f,0,1,'3(c)');
    
    simpsons_rule(f,0,1,'3(d)');
    
    simpsons_3_8th(f,0, double(1/3), double(2/3), 1,'3(e)');
end