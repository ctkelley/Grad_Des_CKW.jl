function Figure1a(n = 15; maxit = 20000, alpha = 0.5)
    (n > 15) && (maxit=100000)
    tau_test1(n; maxit = maxit)
    ts=L"\tau_0"
    as=L"\alpha"
    tautex="Alg1: testing "*ts*". n=$n," * as * " =$alpha"
    println(tautex)
    #title("Ex1, Alg 1; testing tau. n=$n, p=$p")
    title(tautex)
end

function Figure1b(n = 15; maxit = 4000, tau0 = 0.01)
    (n > 15) && (maxit=100000)
    ts=L"\tau_0"
    as=L"\alpha"
    ptex="Ex1, Alg 1; testing "*as*". n=$n," * ts * "=$tau0"
    p_test1(n; maxit = maxit)
    title(ptex)
    #title("Alg 1; testing p. n=$n, tau0=$tau0")
end

function Figure2(n = 15; maxit = 10000, tau0 = 0.1)
    (n > 15) && (maxit=100000)
    ts=L"\tau_0"
    as=L"\alpha"
    ptex="Ex1, Alg 2; testing "*as*". n=$n," * ts * "=$tau0"
    p_test1(n; maxit = maxit, algfun = alg2e1)
    title(ptex)
    #title("Alg 2; testing p. n=$n, tau0=$tau0")
end

function Figure3_4a(n = 15; maxit = 20000, alpha = 0.5, tauvec = [0.2, 0.1, 0.05, 0.01])
    (n > 15) && (maxit=100000)
    tau_test1(n; maxit = maxit, algfun = alg3e1, tauvec = tauvec)
    ts=L"\tau_0"
    as=L"\alpha"
    tautex="Ex1, Alg3: testing "*ts*". n=$n," * as * " =$alpha"
    println(tautex)
    #title("Alg 3; testing tau. n=$n, alpha=$p")
    title(tautex)
end

function Figure3_4b(n = 15; maxit = 400, tau0 = 20.0, 
        pvec=[.1, .2, .4, .5])
    (n > 15) && (maxit=100000)
    ts=L"\tau_0"; as=L"\alpha"
    ptex="Ex1, Alg3: testing "*as*". n=$n," * ts * "=$tau0"
    p_test1(n; maxit = maxit, algfun = alg3e1, tau0 = tau0, pvec=pvec)
    title(ptex)
    #title("Alg 3; testing "*as*". n=$n, tau0=$tau0")
end

function Figure6ab(n = 15; maxit = 1000, tau0 = 20.0, alpha = 0.5)
    ts=L"\tau_0"
    as=L"\alpha"
    ptex="grad norm vs error. "*as*"=$alpha," * ts * "=$tau0"
    res_test1(n; maxit = maxit, algfun = alg3e1, tau0 = tau0, alpha = alpha)
    title(ptex)
end

function Figure5bd(n=15; tau0=20.0, maxit=2000, pvec=[.5, .6, .7, .8])
    ts=L"\tau_0"; as=L"\alpha"
    ptex="Ex2, Alg3: testing "*as*". n=$n," * ts * "=$tau0"
    Alg3_alpha_test(15; tau0=tau0, pvec=pvec, maxit=maxit)
    title(ptex)
end

function Figure5ac(n=15; tau0=.1, maxit=200, pvec=[.1, .2, .3, .4])
    ts=L"\tau_0"; as=L"\alpha"
    ptex="Ex2, Alg1: testing "*as*". n=$n," * ts * "=$tau0"
    p_test2(n; tau0=tau0, algfun=alg1e2, maxit=maxit, pvec=pvec)
    title(ptex)
end

