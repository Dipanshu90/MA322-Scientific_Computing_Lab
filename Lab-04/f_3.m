function [f,x,a] = f_3()
    syms x1 x2 x3
    
    f1(x1, x2, x3) = 6*x1 - 2*cos(x2*x3) - 1;
    f2(x1, x2, x3) = 9*x2 + sqrt(x1^2 + sin(x3) + 1.06) + 0.9;
    f3(x1, x2, x3) = 60*x3 + 3*exp(-x1*x2) + 10*3.14 - 3;
    
    f = [f1;f2;f3]; % f = [;;] f.' = [,,]
    x = [x1;x2;x3];
    a = [0;0;0];
end