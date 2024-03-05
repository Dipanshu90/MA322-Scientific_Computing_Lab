function que6()
    Time = [0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84];
    Speed = [124, 134, 148, 156, 147, 133, 121, 109, 99, 85, 78, 89, 104, 116, 123];
    
    l = length(Speed);
    h = Time(2) - Time(1);
    
    % trapezoidal rule
    dist = 0;
    
    for i=1:l-1
        dist = dist + h*(Speed(i) + Speed(i+1))/2;
    end
    
    fprintf('The approximate length of the track by trapezoidal rule is :- %f.\n', dist);
    
    % rectangle rule
    dist = 0;
    
    for i=1:l-1
        dist = dist + h*(Speed(i));
    end
    
    fprintf('The approximate length of the track by rectangle rule is :- %f.\n', dist);
end