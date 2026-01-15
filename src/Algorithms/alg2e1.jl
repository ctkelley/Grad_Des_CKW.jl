function alg2e1(n; nu = 0.5, alpha = 0.5, tau0 = 0.1, maxit = 20000, 
    epsilon = 1.e-6)
    pdata=build_problem(n, uefun_ex12d; alpha = alpha, nu = nu);
    u0=pdata.u0;
    R=FEX1(u0, pdata);
    N=length(u0);
    mu = pdata.mu
    GDE2=GD_Prob(fobj, FEX1, proj0, pdata, u0, mu)
    algout=alg2(GDE2, R, tau0, epsilon, maxit)
    reshist=algout.reshist
    errhist=algout.errhist
    alg2out=(reshist = reshist, errhist = errhist) 
end
