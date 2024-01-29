function output_file()
    clc
    
    fprintf('Bisection Method for Q-1\n');
    Bisection(0,1,1e-8,@f_1,'1');
    
    fprintf('Bisection Method for Q-2(a)\n');
    Bisection(0.5,1.5,1e-5,@f_2a, '2(a)');
    
    fprintf('Bisection Method for Q-2(b)\n');
    Bisection(0,4,1e-5,@f_2b,'2(b)');
    
    fprintf('Bisection Method for Q-2(c)\n');
    Bisection(3,4,1e-5,@f_2c,'2(c)');
    
    fprintf('Newton Method for Q-3(a)\n');
    Newton(1.5,@f_3a, @f_3a_dash,1e-5,'3(a)');

    fprintf('Newton Method for Q-3(b)\n');
    Newton(1,@f_3b, @f_3b_dash,1e-5,'3(b)');

    fprintf('Newton Method for Q-3(c)\n');
    Newton(1,@f_3c, @f_3c_dash,1e-5,'3(c)');

    fprintf('Newton Method for Q-3(d)\n');
    Newton(6.5,@f_3d, @f_3d_dash,1e-5,'3(d)');

    fprintf('Newton Method for Q-4\n');
    Newton(1e-4,@f_4, @f_4_dash,1e-10,'4');

    fprintf('Newton Method for Q-5(a) in [-1,0]\n');
    Newton(-0.5,@f_5, @f_5_dash,1e-6,'5(a) in [-1,0]');

    fprintf('Newton Method for Q-5(a) in [0,1]\n');
    Newton(0.5,@f_5, @f_5_dash,1e-6, '5(a) in [0,1]');

    fprintf('Bisection Method for Q-5(b) in [-1,0]\n');
    Bisection(-1, 0, 1e-6,@f_5,'5(b) in [-1,0]');

    fprintf('Bisection Method for Q-5(b) in [0,1]\n');
    Bisection(0, 1, 1e-6, @f_5, '5(b) in [0,1]');

    fprintf('Newton Method for Q-6\n');
    Newton(10,@f_6, @f_6_dash,1e-6,'6');

    fprintf('Newton Method for Q-7\n');
    Newton(2,@f_7, @f_7_dash,1e-6,'7');
end
