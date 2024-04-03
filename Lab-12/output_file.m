function output_file()
    clc

    N1 = 5:1:250;
    N2 = 2*N1;
    
    fprintf('Que-1(a)\n');

    str = ' 1(a) by Adams-Bashforth';
    fprintf(strcat(str, '\n'));
    que1_AB(1, 3, str, N1, N2, 6, 0, @(y,t) 1 + y/t + (y/t)^2, @(t) t*tan(log(t)), 0);

    str = ' 1(a) by Adams-Moulton';
    fprintf(strcat(str, '\n'));
    que1_AM(1, 3, str, N1, N2, 6, 0, @(y,t) 1 + y/t + (y/t)^2, @(t) t*tan(log(t)), 0);

    fprintf('Que-1(b)\n');

    str = ' 1(b) by Adams-Bashforth';
    fprintf(strcat(str, '\n'));
    que1_AB(0, 1, str, N1, N2, 6, 0, @(y,t) -t*y + 4*t/y, @(t) sqrt(4 - 3*exp(-t^2)), 1);

    str = ' 1(b) by Adams-Moulton';
    fprintf(strcat(str, '\n'));
    que1_AM(0, 1, str, N1, N2, 6, 0, @(y,t) -t*y + 4*t/y, @(t) sqrt(4 - 3*exp(-t^2)), 1);

    fprintf('Que-2\n');

    N1 = [5, 10, 20, 40, 80];

    str = ' Q2';
    fprintf('\n');
    que2(0, 1, str, N1, @(y,t) -2 * y + 1, @(t) (exp(-2*t) + 1) / 2, 1);

    fprintf('Que-3\n');

    N1 = 5:1:250;

    str = ' Q3 by Adams-Bashforth';
    fprintf(strcat(str, '\n'));
    que1_AB(0, 1, str, N1, N2, 1, 0, @(y,t) y - t^2 + 1, @(t) (t+1)^2 - 0.5 * exp(t), 0.5);

    str = ' Q3 by Adams-Moulton';
    fprintf(strcat(str, '\n'));
    que1_AM(0, 1, str, N1, N2, 1, 0, @(y,t) y - t^2 + 1, @(t) (t+1)^2 - 0.5 * exp(t), 0.5);

    fprintf('Que-4\n');

    str = ' Q4 by Adams fourth order Predictor Corrector';
    fprintf(strcat(str, '\n'));
    que4_APC(0, 1, str, N1, N2, 1, 1, @(y,t) y - t^2 + 1, @(t) (t+1)^2 - 0.5 * exp(t), 0.5);
end