function que2()
    syms x
    
    Time = [0, 3, 5, 8, 13];
    Distance = [0, 225, 383, 623, 993];
    Speed = [75, 77, 80, 74, 72];
    
    [H(x), Q] = Hermite_interpolation(Time, Distance, Speed);
    
    % part (a)
    fprintf('Part - (a)\n\n');
    fprintf('Approximate position of the car at t = 10 sec = %f feet.\n', double(subs(H,x,10)));
    H_dash(x) = diff(H,x);
    fprintf('Approximate speed of the car at t = 10 sec = %f feet/s.\n', double(subs(H_dash,x,10)));
    fprintf('_____________________________________________________________________________________________________\n\n');
    
    figure
    fplot(H, [0,14],'LineWidth',2);
    hold on;
    plot(Time, Distance,'kd', 'Linewidth', 4);
    grid on;
    title('Function plot Que-2');
    xlabel('Time');
    ylabel('Distance');
    legend('H(x)', 'nodes');
    hold off;

%     h = 1e-20;
%     
%     H_dash(x) = (subs(H,x,x+h) - H(x))/h;
%     fprintf('Approximate speed of the car at t = 10 sec = %f feet/s.\n', double(subs(H_dash,x,10)));

    % part (b)
    max_speed = double(2904/36);
    
    figure
    fplot(H_dash, [0,13.3],'LineWidth',2);
    hold on;
    plot(Time, Speed,'kd', 'Linewidth', 4);
    hold on;
    fplot(@(x) max_speed, [0,13.3], 'LineWidth',2);
    grid on;
    title('Function plot Que-2');
    xlabel('Time');
    ylabel('Speed');
    legend('H(x)', 'nodes', 'Speed Threshold');
    hold off;
    
    interval = 5:0.001:6;
    err = 1;
    t0=5;
    for i = interval
        if abs(max_speed - double(subs(H_dash,x,i))) < err
            err = abs(max_speed - double(subs(H_dash,x,i)));
            t0 = i;
        end
    end
    fprintf('Part-(b)\n\n');
    fprintf('The speed of car exceeds 55 mi/h first at t = %f sec.\n', t0);
    fprintf('_____________________________________________________________________________________________________\n\n');
    
    % part (c)
    interval = 11:0.001:13;
    max_pred_speed = 0;
    for i = interval
        max_pred_speed = max(max_pred_speed, double(subs(H_dash,x,i)));
    end
    fprintf('Part-(c)\n\n');
    fprintf('The predicted maximum speed of car = %f feet/s\n\n', max_pred_speed);

end