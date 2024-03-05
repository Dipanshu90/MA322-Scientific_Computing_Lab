function que5()
    syms x
    
    f = x*log(x);
    
    comp_trap_rule(f,1,2,1e-5,'5(a)');
    
    comp_mid_pt_rule(f,1,2,1e-5,'5(b)');
    
    comp_simp_rule(f,1,2,1e-5,'5(c)');
end