function alg1e1(n; nu = 0.5, p = 0.5, tau0 = 0.1, maxit = 20000)
    pdata=build_problem(n, uefun_ex12d; p = p, nu = nu)
    u0=pdata.u0
    R=FEX1(u0, pdata)
    N=length(u0)
    tau=tau0/N
    mu = 2.0*pi*pi
    GDE1=GD_Prob(fobj, FEX1, proj0, pdata, u0, mu)
    algout = alg1(GDE1, R, tau, maxit)
    #    algout = alg1(u0, fobj, FEX1, proj0, pdata, R, tau, maxit)
    reshist=algout.reshist
    errhist=algout.errhist
    alg1out=(reshist = reshist, errhist = errhist)
end
