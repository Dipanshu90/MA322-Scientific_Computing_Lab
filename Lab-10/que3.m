function que3()
    t = [1.00, 1.01, 1.02, 1.03, 1.04];
    f = [3.10, 3.12, 3.14, 3.18, 3.24];
    h = t(2) - t(1);
    
    f1 = zeros(1,length(f));
    for i=1:length(f)-1
        f1(i) = (f(i+1) - f(i)) / h;
    end
    f1(end) = (f(end) - f(length(f) - 1)) / h;
    
    L = 0.98;
    R = 0.142;
    
    Voltage = L*f1 + R*f;
    for i=1:length(Voltage)
        fprintf('The approximate Voltage E(t) at t = %.2f is %.4f\n', t(i), Voltage(i));
    end
    fprintf('\n');
end