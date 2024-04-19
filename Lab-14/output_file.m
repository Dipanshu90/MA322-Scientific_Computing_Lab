function output_file()
    clc
    N = 2:60;

    fprintf('Que-1(a)\n');
    que1a(N,2,' Que-1(a)');
    fprintf('Que-1(b)\n');
    que1b(N,5,' Que-1(b)');

    fprintf('Que-2(a)\n');
    que2a(N,2,' Que-2(a)');
    fprintf('Que-2(b)\n');
    que2b(N,5,' Que-2(b)');

    fprintf('Que-3(a)\n');
    que3a(N, 2,' Que-3(a)');
    fprintf('Que-3(b)\n');
    que3b(N, 5,' Que-3(b)');

    N = 4:20;

    fprintf('Que-4(a)\n');
    que4a(N,' Que-4(a)');
    fprintf('Que-4(b)\n');
    que4b(N,' Que-4(b)');
end