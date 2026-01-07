function fdgrad2(n = 15, delu = 1.e-4)
    pdata=build_problem2(n)
    N=n*n
    u=pdata.u0
    w=rand(N)
    du=u+delu*w
    fp=fobj2(du, pdata)
    dum=u-delu*w
    fm=fobj2(dum, pdata)
    dgrad=0.5*(fp-fm)/delu
    egrad = FEX2(u, pdata)
    dder=dot(egrad, w)
    grad_err=abs(dder-dgrad)
    GradOK = (grad_err < 1.e-4)
    return GradOK
end
