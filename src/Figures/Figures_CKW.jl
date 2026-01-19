function Figure1_2a(n = 15; maxit = 20000, alpha = 0.5)
    (n > 15) && (maxit=100000)
    tau_test1(n; maxit = maxit)
    ts=L"\tau_0"
    as=L"\alpha"
    tautex="testing "*ts*". n=$n," * as * " =$alpha"
    println(tautex)
    #title("Alg 1; testing tau. n=$n, p=$p")
    title(tautex)
end

function Figure1_2b(n = 15; maxit = 20000, tau0 = 0.01)
    (n > 15) && (maxit=100000)
    ts=L"\tau_0"
    as=L"\alpha"
    ptex="Alg 1; testing "*as*". n=$n," * ts * "=$tau0"
    p_test1(n; maxit = maxit)
    title(ptex)
    #title("Alg 1; testing p. n=$n, tau0=$tau0")
end

function Figure3(n = 15; maxit = 20000, tau0 = 0.1)
    (n > 15) && (maxit=100000)
    ts=L"\tau_0"
    as=L"\alpha"
    ptex="Alg 2; testing "*as*". n=$n," * ts * "=$tau0"
    p_test1(n; maxit = maxit, algfun = alg2e1)
    title(ptex)
    #title("Alg 2; testing p. n=$n, tau0=$tau0")
end

function Figure4_5a(n = 15; maxit = 20000, alpha = 0.5, tauvec = [0.2, 0.1, 0.05, 0.01])
    (n > 15) && (maxit=100000)
    tau_test1(n; maxit = maxit, algfun = alg3e1, tauvec = tauvec)
    ts=L"\tau_0"
    as=L"\alpha"
    tautex="testing "*ts*". n=$n," * as * " =$alpha"
    println(tautex)
    #title("Alg 3; testing tau. n=$n, alpha=$p")
    title(tautex)
end

function Figure4_5b(n = 15; maxit = 400, tau0 = 20.0)
    (n > 15) && (maxit=100000)
    ts=L"\tau_0"
    as=L"\alpha"
    ptex="testing "*as*". n=$n," * ts * "=$tau0"
    p_test1(n; maxit = maxit, algfun = alg3e1, tau0 = tau0)
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

function Figure78b(n=15; tau0=20.0, maxit=2000, pvec=[.5, .6, .7, .8])
    Alg3_alpha_test(15; tau0=tau0, pvec=pvec, maxit=maxit)
end

function Figure78a(n=15; tau0=.1, maxit=200, pvec=[.1, .2, .3, .4])
    p_test2(n; tau0=tau0, algfun=alg1e2, maxit=maxit, pvec=pvec)
end

