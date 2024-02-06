function [f,x,a] = f_2b()
    syms x1 x2

    f1(x1, x2) = 1 + x1^2 - x2^2 + exp(x1)*cos(x2);
    f2(x1, x2) = 2*x1*x2 + exp(x1)*sin(x2);
    
    f = [f1;f2]; % f = [;;] f.' = [,,]
    x = [x1;x2];
    a = [-1;4];
end