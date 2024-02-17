function fun_plot(p, a, b, x0)
    syms x
    
    figure
    fplot(@(x) p(x),[a,b],'LineWidth',2);
    hold on
    plot(x0, double(subs(p,x,x0)), 'kd','LineWidth',4);
    t = strcat('Function Plot Que-2');
    title(t)
end