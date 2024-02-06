function output_file()
    clc
    
    fprintf('Newton Method for system of equations Que-1\n\n');
    Multidim_newton(@f_1,6,0,'1');

    fprintf('Newton Method for system of equations Que-2(a)\n\n');
    Multidim_newton(@f_2a,2,0,'2(a)');

    fprintf('Newton Method for system of equations Que-2(b)\n\n');
    Multidim_newton(@f_2b,5,0,'2(b)');
    
    fprintf('Newton Method for system of equations Que-3\n\n');
    Multidim_newton(@f_3,1000,1e-6,'3');
end