function [fwd_diff1, back_diff1, fwd_diff2, back_diff2] = que1()
    % part (a)
    fprintf('Part - (a)\n');
    X = [0.5, 0.6, 0.7];
    Fx = [0.4794, 0.5646, 0.6442];
    
    fwd_diff1 = [];
    for i = 1:(length(X)-1)
        fwd_diff1 = [fwd_diff1, (Fx(i+1) - Fx(i))/(X(i+1) - X(i))];
    end
    fprintf('The forward differences are:-\n    ');
    for i = 1:length(fwd_diff1)
        fprintf('%.4f\t', fwd_diff1(i));
    end
    fprintf('   -\n');
    
    back_diff1 = [];
    
    for i=2:length(X)
        back_diff1 = [back_diff1, (Fx(i) - Fx(i-1))/(X(i) - X(i-1))];
    end
    fprintf('The backward differences are:-\n    ');
    fprintf('   -\t');
    for i = 1:length(back_diff1)
        fprintf('%.4f\t  ', back_diff1(i));
    end
    fprintf('\n\n');
    % part (b)
    fprintf('Part - (b)\n');
    X = [1.0, 1.2, 1.4];
    Fx = [1.0000, 1.2625, 1.6595];
    
    fwd_diff2 = [];
    for i = 1:(length(X)-1)
        fwd_diff2 = [fwd_diff2, (Fx(i+1) - Fx(i))/(X(i+1) - X(i))];
    end
    fprintf('The forward differences are:-\n    ');
    for i = 1:length(fwd_diff2)
        fprintf('%.4f\t', fwd_diff2(i));
    end
    fprintf('   -\n');
    
    back_diff2 = [];
    
    for i=2:length(X)
        back_diff2 = [back_diff2, (Fx(i) - Fx(i-1))/(X(i) - X(i-1))];
    end
    fprintf('The backward differences are:-\n    ');
    fprintf('   -\t');
    for i = 1:length(back_diff2)
        fprintf('%.4f\t  ', back_diff2(i));
    end
    fprintf('\n\n');
end