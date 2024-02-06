function val = inf_norm(a)
    m = min(a);
    M = max(a);
    
    val = max(abs(M), abs(m));
end