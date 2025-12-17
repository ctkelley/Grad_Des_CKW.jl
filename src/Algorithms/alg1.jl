function alg1e1(n; nu = 0.5, p = 0.5, tau0 = 0.1, maxit = 20000)
    pdata=build_problem(n, uefun_ex12d; p = p, nu = nu)
    u=pdata.u0
    uex=pdata.uex1d
    E0=norm(u - uex)
    E=E0
    R=FEX1(u, pdata)
    reshist=Float64[]
    errhist=Float64[]
    N0=norm(R)
    push!(reshist, 1.0)
    push!(errhist, E/E0)
    N=length(u)
    tau=tau0/N
    RX=copy(R)
    ux=copy(u)
    fc = fobj(u,pdata)
    for ix = 1:maxit
        u .= proj0(u - tau * R)
        R .= FEX1(u, pdata)
        ft = fobj(u,pdata)
        if (norm(R) > norm(RX))
#        if (ft > fc)
            u .= ux
            R .= RX
        else
            fc = ft
            RX .= R
            ux .= u
        end
        rrnrm=norm(R) /N0
        push!(reshist, rrnrm)
        E=norm(u - uex)
        push!(errhist, E/E0)
    end
    alg1out=(reshist = reshist, errhist = errhist)
end

function alg1(u0, gradf, fobj, proj, maxit, tau, pdata, uex=[])
   u = copy(u0)
   fc = fobj(u0,pdata)
   R = gradf(u0, pdata)
   reshist=Float64[]
    E0=norm(u - uex)
    E=E0
    errhist=Float64[]
    N0=norm(R)
    push!(reshist, 1.0)
    push!(errhist, E/E0)
    RX=copy(R)
    ux=copy(u)
    for ix = 1:maxit
        u .= proj0(u - tau * R)
        R .= FEX1(u, pdata)
        if (fobj(u,pdata) > fobj(ux,pdata))
            u .= ux
            R .= RX
        else
            RX .= R
            ux .= u
        end
        rrnrm=norm(R)/N0
        push!(reshist, rrnrm)
        E=norm(u - uex)
        push!(errhist, E/E0)
    end
end



