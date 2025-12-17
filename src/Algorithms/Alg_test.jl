function tau_test1(n; nu = 0.5, p = 0.5, maxit = 20000)
    tauvec=[0.2, 0.1, 0.05, 0.01]
    labelarray =
        ([string(tauvec[1]), string(tauvec[2]), string(tauvec[3]), string(tauvec[4])])
    ntau=length(tauvec)
    #errmat=zeros(maxit+1,ntau)
    avals=Vector{Array}(undef, 4);
    for itau = 1:ntau
        aout=alg1e1(n; tau0 = tauvec[itau], maxit = maxit)
        avals[itau] = aout.errhist
        #    errmat[:,itau] .= aout.errhist
        #    semilogy(aout.errhist)
    end
    plothist(avals, labelarray, "error")
end

function p_test1(n; nu = 0.5, tau0 = 0.01, algfun=alg1e1, maxit=20000)
    pvec=[0.1, 0.2, 0.5, 0.8]
    labelarray = ([string(pvec[1]), string(pvec[2]), string(pvec[3]), string(pvec[4])])
    np=length(pvec)
    avals=Vector{Array}(undef, 4);
    for ip = 1:np
        aout=algfun(n; tau0 = tau0, p = pvec[ip], maxit=maxit)
        avals[ip]=aout.errhist
    end
    plothist(avals, labelarray, "error")
end
