function alg2e1(n; nu = 0.5, p = 0.5, tau0 = 0.1, maxit = 20000, epsilon=1.e-6)
    pdata=build_problem(n, uefun_ex12d; p = p, nu = nu)
    u=pdata.u0
    uex=pdata.uex1d
    E0=norm(u - uex)
    E=E0
    R=FEX1(u, pdata)
    fc=fobj(u,pdata)
    reshist=Float64[]
    errhist=Float64[]
    N0=norm(R, Inf)
    push!(reshist, 1.0)
    push!(errhist, E/E0)
    N=length(u)
    tau=tau0/N
    RX=copy(R)
    ux=copy(u)
    tau=tau0
#
# Approximation of mu for the first example
#
    mu = .25*(n+1.0)^2
    for ix = 1:maxit
        u .= proj0(u - tau * R)
        fp = fobj(u,pdata)
        df = fp - fc
# The sufficient decrease condition is WEAKER that simple decrease
# because of the extra positive terms 
        SD1 = dot(R,u-ux) + .5 * dot(u-ux,u-ux)/tau + mu*epsilon^2/4
        R .= FEX1(u, pdata)
        if (df > SD1) 
            u .= ux
            R .= RX
           tau *= .5
        else
# Make sure that you get simple decrease after accepting the step
            if (df < 0)
            RX .= R
#            R .= FEX1(u, pdata)
            ux .= u
            fc = fobj(u,pdata)
            end
        end
        rrnrm=norm(R, Inf)/N0
        push!(reshist, rrnrm)
        E=norm(u - uex)
        push!(errhist, E/E0)
    end
    alg2out=(reshist = reshist, errhist = errhist)
end
