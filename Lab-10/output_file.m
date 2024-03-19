function output_file()
    clc
    syms x y t
    
    fprintf('Que-1\n');
    [fd1, bd1, fd2, bd2] = que1();
    
    fprintf('Que-2(a)\n');
    f(x) = sin(x);
    X = [0.5, 0.6, 0.7];
    que2(f, fd1, bd1, X);
    
    fprintf('Que-2(b)\n');
    f(x) = x^2*log(x) + 1;
    X = [1.0, 1.2, 1.4];
    que2(f, fd2, bd2, X);
    
    fprintf('Que-3\n');
    que3();

    N1 = 1:1:25;
    N2 = 2*N1;
    fprintf('Que-4(a)\n');
    que4(1, 2, ' 4(a)', N1, N2, 4, 1+y/t, t*log(t) + 2*t, 2);

    fprintf('Que-4(b)\n');
    que4(0, 1, ' 4(b)', N1, N2, 4, cos(2*t) + sin(3*t), sin(2*t)/2 - cos(3*t)/3 + 4/3, 1);

    fprintf('Que-4(c)\n');
    que4(2, 3, ' 4(c)', N1, N2, 4, -y + t*sqrt(y), exp(-t)*(exp(t/2)*(t-2) + sqrt(2)*exp(1))^2, 2);

    N1 = 1:1:40;
    N2 = 2*N1;
    N3 = [25,50,100];
    fprintf('Que-5\n');
    que5(0, 5, N1, N2, N3, -y + t + 1, exp(-t) + t, 1);
end