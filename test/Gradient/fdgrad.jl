#
# Compare gradent to central diff. 
# This is simply to verify that I have consistent formulae.
#
function fdgrad(n=15, delu = 1.e-4)
    pdata=build_problem(n, uefun_ex12d)
    N=n*n
    u=pdata.u0
    w=rand(N)
    f0=fobj(u, pdata)
    du=u+delu*w
    fp=fobj(du, pdata)
    dum=u-delu*w
    fm=fobj(dum, pdata)
    dgrad=0.5*(fp-fm)/delu
    #dgrad=(fp-f0)/delu
    egrad = FEX1(u, pdata)
    dder=dot(egrad, w)
    grad_err=abs(dder-dgrad)
    GradOK = (grad_err < 1.e-4)
    return GradOK
end
