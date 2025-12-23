function alg2(u0, fobj, fgrad, proj, pdata, R, tau0, epsilon, maxit)
    uex=pdata.uex1d
    E0=norm(u0 - uex)
    E = E0
    mu=pdata.mu
    reshist=Float64[]
    errhist=Float64[]
    N0=norm(R)
    push!(reshist, 1.0)
    push!(errhist, E/E0)
    RX=copy(R)
    u = copy(u0)
    ux=copy(u)
    fc = fobj(u, pdata)
    reshist=Float64[]
    errhist=Float64[]
    N0=norm(R, Inf)
    gnormc=norm(R)
    push!(reshist, 1.0)
    push!(errhist, E/E0)
    N=length(u)
    tau=tau0/N
    RX=copy(R)
    ux=copy(u)
    for ix = 1:maxit
        u .= proj0(u - tau * R)
        fp = fobj(u, pdata)
        df = fp - fc
        # The sufficient decrease condition is WEAKER that simple decrease
        # because of the extra positive terms
        SD1 = dot(R, u-ux) + 0.5 * dot(u-ux, u-ux)/tau + mu*epsilon^2/4
        R .= fgrad(u, pdata)
        gnormp=norm(R)
        dg = gnormp - gnormc
        if (df > SD1)
            u .= ux
            R .= RX
            tau *= 0.5
        else
            # Make sure that you get simple decrease after accepting the step
            if (dg < 0)
                RX .= R
                gnorm=gnormp
                #            R .= fgrad(u, pdata)
                ux .= u
                fc = fobj(u, pdata)
            end
        end
        rrnrm=norm(R, Inf)/N0
        push!(reshist, rrnrm)
        E=norm(u - uex)
        push!(errhist, E/E0)
    end
    alg2ouot=(sol = u, reshist = reshist, errhist = errhist)
end

function alg2(GP::GD_Prob, R, tau, epsilon, maxit)
    u0=GP.u0
    fobj=GP.fobj
    fgrad=GP.fgrad
    pdata=GP.pdata
    proj=GP.projb
#    mu = GP.mu
aout=alg2(u0, fobj, fgrad, proj, pdata, R, tau, epsilon, maxit)
end
