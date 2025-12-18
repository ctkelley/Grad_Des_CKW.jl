function alg1(u0, fobj, fgrad, proj, pdata, R, tau, maxit)
    uex=pdata.uex1d
    E0=norm(u0 - uex)
    E = E0
    reshist=Float64[]
    errhist=Float64[]
    N0=norm(R)
    push!(reshist, 1.0)
    push!(errhist, E/E0)
    RX=copy(R)
    u = copy(u0)
    ux=copy(u)
    fc = fobj(u,pdata)
    for ix = 1:maxit
        u .= proj(u - tau * R)
        R .= fgrad(u, pdata)
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
        return(sol=u, reshist=reshist, errhist=errhist)
end

function alg1(GP::GD_Prob, R, tau, maxit)
u0=GP.u0
fobj=GP.fobj
fgrad=GP.fgrad
pdata=GP.pdata
proj=GP.projb
aout=alg1(u0, fobj, fgrad, proj, pdata, R, tau, maxit)
return aout
end
