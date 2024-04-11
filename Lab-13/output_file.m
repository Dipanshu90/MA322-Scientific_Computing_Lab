function output_file()
    clc

    N1 = 1:1:250;
    N2 = 2*N1;
    
    fprintf('Que-1\n');

    str = ' Que-1 by Linear-Shooting';
    fprintf(strcat(str, '\n'));
    que1(0, pi/2, str, N1, N2, [2, 4, 0], @(x) 1, @(x) 2, @(x) cos(x), @(x) (-1/10)*(sin(x) + 3*cos(x)), -0.3, -0.1);

    fprintf('Que-2\n');

    str = ' Que-2(a)';
    fprintf(strcat(str, ' by scheme-1\n'));
    que2_1(1, 2, str, N1, N2, [19, 0], @(x) -4/x, @(x) -2/x^2, @(x) 2*log(x)/x^2, @(x) 4/x - 2/x^2 + log(x) - 3/2, 1/2, log(2), 1);
    fprintf(strcat(str, ' by scheme-2\n'));
    que2_1(1, 2, str, N1, N2, [19, 0], @(x) -4/x, @(x) -2/x^2, @(x) 2*log(x)/x^2, @(x) 4/x - 2/x^2 + log(x) - 3/2, 1/2, log(2), 2);
    fprintf(strcat(str, ' by scheme-3\n'));
    que2_1(1, 2, str, N1, N2, [19, 0], @(x) -4/x, @(x) -2/x^2, @(x) 2*log(x)/x^2, @(x) 4/x - 2/x^2 + log(x) - 3/2, 1/2, log(2), 3);

    str = ' Que-2(b)';
    fprintf(strcat(str, ' by scheme-1\n'));
    que2_1(0, 2, str, N1, N2, [19, 0], @(x) 2, @(x) -1, @(x) x*exp(x) - x, @(x) x^3*exp(x)/6 - 5*x*exp(x)/3 + 2*exp(x) - x - 2, 0, -4, 1);
    fprintf(strcat(str, ' by scheme-2\n'));
    que2_1(0, 2, str, N1, N2, [19, 0], @(x) 2, @(x) -1, @(x) x*exp(x) - x, @(x) x^3*exp(x)/6 - 5*x*exp(x)/3 + 2*exp(x) - x - 2, 0, -4, 2);
    fprintf(strcat(str, ' by scheme-3\n'));
    que2_1(0, 2, str, N1, N2, [19, 0], @(x) 2, @(x) -1, @(x) x*exp(x) - x, @(x) x^3*exp(x)/6 - 5*x*exp(x)/3 + 2*exp(x) - x - 2, 0, -4, 3);

    str = ' Que-2(c)';
    fprintf(strcat(str, ' by scheme-1\n'));
    que2_2(0, pi/2, str, N1, N2, [19, 0], @(x) 1, @(x) 2, @(x) cos(x), @(x) (-1/10)*(sin(x) + 3*cos(x)), -1/10, 3/10, 1);
    fprintf(strcat(str, ' by scheme-2\n'));
    que2_2(0, pi/2, str, N1, N2, [19, 0], @(x) 1, @(x) 2, @(x) cos(x), @(x) (-1/10)*(sin(x) + 3*cos(x)), -1/10, 3/10, 2);
    fprintf(strcat(str, ' by scheme-3\n'));
    que2_2(0, pi/2, str, N1, N2, [19, 0], @(x) 1, @(x) 2, @(x) cos(x), @(x) (-1/10)*(sin(x) + 3*cos(x)), -1/10, 3/10, 3);

    str = ' Que-2(d)';
    fprintf(strcat(str, ' by scheme-1\n'));
    que2_2(-1, 0, str, N1, N2, [19, 0], @(x) -x, @(x) 2, @(x) 2 + (2+x^2)*exp(x), @(x) x^2 + x*exp(x), -2, 1, 1);
    fprintf(strcat(str, ' by scheme-2\n'));
    que2_2(-1, 0, str, N1, N2, [19, 0], @(x) -x, @(x) 2, @(x) 2 + (2+x^2)*exp(x), @(x) x^2 + x*exp(x), -2, 1, 2);
    fprintf(strcat(str, ' by scheme-3\n'));
    que2_2(-1, 0, str, N1, N2, [19, 0], @(x) -x, @(x) 2, @(x) 2 + (2+x^2)*exp(x), @(x) x^2 + x*exp(x), -2, 1, 3);

    str = ' Que-2(e)';
    fprintf(strcat(str, ' by scheme-1\n'));
    que2_3(0, 1, str, N1, N2, [19, 0], @(x) -2, @(x) -1, @(x) x, @(x) 2*exp(-x) + (exp(1) - 2)*x*exp(-x) + x - 2, exp(1) - 3, 1 - 2/exp(1), 1);
    fprintf(strcat(str, ' by scheme-2\n'));
    que2_3(0, 1, str, N1, N2, [19, 0], @(x) -2, @(x) -1, @(x) x, @(x) 2*exp(-x) + (exp(1) - 2)*x*exp(-x) + x - 2, exp(1) - 3, 1 - 2/exp(1), 2);
    fprintf(strcat(str, ' by scheme-3\n'));
    que2_3(0, 1, str, N1, N2, [19, 0], @(x) -2, @(x) -1, @(x) x, @(x) 2*exp(-x) + (exp(1) - 2)*x*exp(-x) + x - 2, exp(1) - 3, 1 - 2/exp(1), 3);

    str = ' Que-2(f)';
    fprintf(strcat(str, ' by scheme-1\n'));
    que2_3(0, pi/4, str, N1, N2, [19, 0], @(x) -cos(x), @(x) -1, @(x) (sqrt(2)-1)*(cos(x))^2 - sin(2*x)/2, @(x) cos(x) + (sqrt(2)-1)*sin(x), sqrt(2), 2 - sqrt(2), 1);
    fprintf(strcat(str, ' by scheme-2\n'));
    que2_3(0, pi/4, str, N1, N2, [19, 0], @(x) -cos(x), @(x) -1, @(x) (sqrt(2)-1)*(cos(x))^2 - sin(2*x)/2, @(x) cos(x) + (sqrt(2)-1)*sin(x), sqrt(2), 2 - sqrt(2), 2);
    fprintf(strcat(str, ' by scheme-3\n'));
    que2_3(0, pi/4, str, N1, N2, [19, 0], @(x) -cos(x), @(x) -1, @(x) (sqrt(2)-1)*(cos(x))^2 - sin(2*x)/2, @(x) cos(x) + (sqrt(2)-1)*sin(x), sqrt(2), 2 - sqrt(2), 3);
end