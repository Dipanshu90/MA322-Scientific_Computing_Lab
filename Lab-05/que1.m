% Given data points
syms x

X = [0.0, 0.2, 0.4, 0.6, 0.8];
y = [1.00000, 1.22140, 1.49182, 1.82212, 2.22554];

p(x) = forward_diff(X,y);
x0 = 0.05;
fprintf('The approximate value of f(0.05) is: %.8f\n\n', double(subs(p,x,x0)));

p(x) = backward_diff(X,y);
x0 = 0.65;
fprintf('The approximate value of f(0.65) is: %.8f\n', double(subs(p,x,x0)));
