function Figure1_2a(n=15; maxit=20000, p=.5)
(n > 15) && (maxit=100000)
tau_test1(n;maxit=maxit)
ts=L"\tau_0"
tautex="testing "*ts*". n=$n, p=$p"
println(tautex)
#title("Alg 1; testing tau. n=$n, p=$p")
title(tautex)
end

function Figure1_2b(n=15; maxit=20000, tau0=.01)
(n > 15) && (maxit=100000)
ts=L"\tau_0"
ptex="Alg 1; testing p. n=$n," *ts* "=$tau0"
p_test1(n; maxit=maxit)
title(ptex)
#title("Alg 1; testing p. n=$n, tau0=$tau0")
end


