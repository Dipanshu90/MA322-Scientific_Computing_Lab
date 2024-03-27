function output_file()
    clc

    N1 = 1:1:100;
    N2 = 2*N1;
    fprintf('Que-1(a)\n');
    
    str = ' 1(a) by Implicit-Euler';
    fprintf(strcat(str, '\n'));
    que1_IE(1, 3, str, N1, N2, 10, @(y,t) 1 + y/t + (y/t)^2, @(t) t*tan(log(t)), 0);

    str = ' 1(a) by Runge-Kutta of Second Order, c2 = 1/2';
    fprintf(strcat(str, '\n'));
    que1_RK(1, 3, str, N1, N2, 10, @(y,t) 1 + y/t + (y/t)^2, @(t) t*tan(log(t)), 0, 2, 1/2);

    str = ' 1(a) by Runge-Kutta of Second Order, c2 = 2/3';
    fprintf(strcat(str, '\n'));
    que1_RK(1, 3, str, N1, N2, 10, @(y,t) 1 + y/t + (y/t)^2, @(t) t*tan(log(t)), 0, 2, 2/3);

    str = ' 1(a) by Runge-Kutta of Second Order, c2 = 1';
    fprintf(strcat(str, '\n'));
    que1_RK(1, 3, str, N1, N2, 10, @(y,t) 1 + y/t + (y/t)^2, @(t) t*tan(log(t)), 0, 2, 1);

    str = ' 1(a) by Runge-Kutta of Fourth Order, classical';
    fprintf(strcat(str, '\n'));
    que1_RK(1, 3, str, N1, N2, 10, @(y,t) 1 + y/t + (y/t)^2, @(t) t*tan(log(t)), 0, 4, 0);

    str = ' 1(a) by Runge-Kutta of Fourth Order, Kutta Method';
    fprintf(strcat(str, '\n'));
    que1_RK(1, 3, str, N1, N2, 10, @(y,t) 1 + y/t + (y/t)^2, @(t) t*tan(log(t)), 0, 4, 1);

    fprintf('Que-1(b)\n');

    str = ' 1(b) by Implicit-Euler';
    fprintf(strcat(str, '\n'));
    que1_IE(0, 1, str, N1, N2, 10, @(y,t) -t*y + 4*t/y, @(t) sqrt(4 - 3*exp(-t^2)), 1);

    str = ' 1(b) by Runge-Kutta of Second Order, c2 = 1/2';
    fprintf(strcat(str, '\n'));
    que1_RK(0, 1, str, N1, N2, 10, @(y,t) -t*y + 4*t/y, @(t) sqrt(4 - 3*exp(-t^2)), 1, 2, 1/2);

    str = ' 1(b) by Runge-Kutta of Second Order, c2 = 2/3';
    fprintf(strcat(str, '\n'));
    que1_RK(0, 1, str, N1, N2, 10, @(y,t) -t*y + 4*t/y, @(t) sqrt(4 - 3*exp(-t^2)), 1, 2, 2/3);

    str = ' 1(b) by Runge-Kutta of Second Order, c2 = 1';
    fprintf(strcat(str, '\n'));
    que1_RK(0, 1, str, N1, N2, 10, @(y,t) -t*y + 4*t/y, @(t) sqrt(4 - 3*exp(-t^2)), 1, 2, 1);

    str = ' 1(b) by Runge-Kutta of Fourth Order, classical';
    fprintf(strcat(str, '\n'));
    que1_RK(0, 1, str, N1, N2, 10, @(y,t) -t*y + 4*t/y, @(t) sqrt(4 - 3*exp(-t^2)), 1, 4, 0);

    str = ' 1(b) by Runge-Kutta of Fourth Order, Kutta Method';
    fprintf(strcat(str, '\n'));
    que1_RK(0, 1, str, N1, N2, 10, @(y,t) -t*y + 4*t/y, @(t) sqrt(4 - 3*exp(-t^2)), 1, 4, 1);

    str = ' Que-2 by Runge-Kutta of Fourth Order, Kutta Method';
    fprintf(strcat(str, '\n'));
    que1_RK(0, 1, str, N1, N2, 4, @(y,t) cos(2*t) + sin(3*t), @(t) sin(2*t)/2 - cos(3*t)/3 + 4/3, 1, 4, 1);

    str = ' Que-2 by Runge-Kutta of Fourth Order, classical';
    fprintf(strcat(str, '\n'));
    que1_RK(0, 1, str, N1, N2, 4, @(y,t) cos(2*t) + sin(3*t), @(t) sin(2*t)/2 - cos(3*t)/3 + 4/3, 1, 4, 0);
end