function que2()
    syms x
    
    f = x^4;
    mid_pt_rule(f,0.5,1,'2 - i(a)');
    
    f = 2/(x-4);
    mid_pt_rule(f,0,0.5,'2 - i(b)'); 
    
    f = 2*x/(x^2 - 4);
    mid_pt_rule(f,1,1.6,'2 - i(c)');
    
    f = exp(3*x)*sin(2*x);
    mid_pt_rule(f,0,pi/4,'2 - i(d)');
    
    f = (sin(x))^2 - 2*x*sin(x) + 1;
    mid_pt_rule(f,0.75,1.3,'2 - i(e)');
    
% ---------------------------------------------------------------------------------
    
    f = x^4;
    trapezoidal_rule(f,0.5,1,'2 - ii(a)');
    
    f = 2/(x-4);
    trapezoidal_rule(f,0,0.5,'2 - ii(b)'); 
    
    f = 2*x/(x^2 - 4);
    trapezoidal_rule(f,1,1.6,'2 - ii(c)');
    
    f = exp(3*x)*sin(2*x);
    trapezoidal_rule(f,0,pi/4,'2 - ii(d)');
    
    f = (sin(x))^2 - 2*x*sin(x) + 1;
    trapezoidal_rule(f,0.75,1.3,'2 - ii(e)');
    
% ---------------------------------------------------------------------------------
    
    f = x^4;
    simpsons_rule(f,0.5,1,'2 - iii(a)');
    
    f = 2/(x-4);
    simpsons_rule(f,0,0.5,'2 - iii(b)'); 
    
    f = 2*x/(x^2 - 4);
    simpsons_rule(f,1,1.6,'2 - iii(c)');
    
    f = exp(3*x)*sin(2*x);
    simpsons_rule(f,0,pi/4,'2 - iii(d)');
    
    f = (sin(x))^2 - 2*x*sin(x) + 1;
    simpsons_rule(f,0.75,1.3,'2 - iii(e)');
end