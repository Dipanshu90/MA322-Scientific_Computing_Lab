function output_file()
    clc
    
    fprintf('Bisection Method for Q-1\n');
    Bisection(0,1,1e-8,@f_1);
    
    fprintf('Bisection Method for Q-2(a)\n');
    Bisection(0.5,1.5,1e-5,@f_2a);
    
    fprintf('Bisection Method for Q-2(b)\n');
    Bisection(0,4,1e-5,@f_2b);
    
    fprintf('Bisection Method for Q-2(c)\n');
    Bisection(3,4,1e-5,@f_2c);
    
    fprintf('Newton Method for Q-3(a)\n');
    Newton(1.5,@f_3a, @f_3a_dash,1e-5);
end
