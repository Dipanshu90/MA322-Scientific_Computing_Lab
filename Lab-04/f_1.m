function [f,x,a] = f_1()
    syms x1 x2 x3
    
    f1(x1, x2, x3) = x1*x2 - (x3)^2 - 1;
    f2(x1, x2, x3) = x1*x2*x3 + (x2)^2 - (x1)^2 - 2;
    f3(x1, x2, x3) = exp(x1) + x3 - exp(x2) - 3;
    
    f = [f1;f2;f3]; % f = [;;] f.' = [,,]
    x = [x1;x2;x3];
    a = [1;1;1];
end