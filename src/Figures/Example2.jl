function Example2a(n=15; notebook=true)
aout1 = alg1e2(15; p=1.5, nu=.1, lambda=20, maxit=100, tau0=.1)
#semilogy(aout1.reshist)
plot(aout1.reshist)
xlabel("iterations")
ylabel("residual norm")
AlgNum="Alg 1"
if notebook
ptex="Example 2 "*AlgNum
title(ptex)
end
end
   

function Example2b(n=15; notebook=true)
aout3 = alg3e2(15; p=1.5, nu=.1, lambda=20, maxit=100, tau0=20.0)
plot(aout3.reshist)
xlabel("iterations")
ylabel("residual norm")
AlgNum="Alg 3"
if notebook
ptex="Example 2 "*AlgNum
title(ptex)
end
end
