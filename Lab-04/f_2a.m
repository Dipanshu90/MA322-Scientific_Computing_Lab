function [f,x,a] = f_2a()
    syms x1 x2

    f1(x1, x2) = 4*x1^2 - x2^2;
    f2(x1, x2) = 4*x1*x2^2 - x1 - 1;
    
    f = [f1;f2]; % f = [;;] f.' = [,,]
    x = [x1;x2];
    a = [0;1];
end