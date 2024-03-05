function que1()
    syms x
    
    f = x^4;
    rectangle_rule(f,0.5,1,'1(a)');
    
    f = 2/(x-4);
    rectangle_rule(f,0,0.5,'1(b)'); 
    
    f = 2*x/(x^2 - 4);
    rectangle_rule(f,1,1.6,'1(c)');
    
    f = exp(3*x)*sin(2*x);
    rectangle_rule(f,0,pi/4,'1(d)');
    
    f = (sin(x))^2 - 2*x*sin(x) + 1;
    rectangle_rule(f,0.75,1.3,'1(e)');
end