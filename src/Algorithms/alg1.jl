function alg1(n; nu = 0.5, p = 0.5, tau0 = 0.1, maxit = 20000)
    pdata=build_problem(n, uefun_chen2d; p = p, nu = nu)
    u=pdata.u0
    uex=pdata.uex1d
    E0=norm(u - uex)
    E=E0
    R=FChen(u, pdata)
    reshist=Float64[]
    errhist=Float64[]
    N0=norm(R, Inf)
    push!(reshist, 1.0)
    push!(errhist, E/E0)
    println(norm(R, Inf))
    N=length(u)
    tau=tau0/N
    RX=copy(R)
    ux=copy(u)
    for ix = 1:maxit

        u .= proj0(u - tau * R)
        R .= FChen(u, pdata)
        if (norm(R) > norm(RX))
            u .= ux
            R .= RX
        else
            RX .= R
            ux .= u
        end
        rrnrm=norm(R, Inf)/N0
        push!(reshist, rrnrm)
        E=norm(u - uex)
        push!(errhist, E/E0)
    end
    println(length(reshist))
    alg1out=(reshist = reshist, errhist = errhist)
end
