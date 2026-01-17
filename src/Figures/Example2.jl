function Example2a(n=15; alpha=.1, tau0=.1, maxit=100, notebook=true)
aout1 = alg1e2(15; p=1.5, alpha=alpha, delta=20, maxit=maxit, tau0=tau0)
println(alpha)
ts=L"\tau_0"
as=L"\alpha"
plot(aout1.reshist,"k-")
xlabel("iterations")
ylabel("residual norm")
AlgNum="Alg 1"
if notebook
ptex="Example 2 "*AlgNum *";"*as*"=$alpha ;"*ts*"=$tau0"
title(ptex)
end
end
   
function Example2b(n=15; notebook=true)
aout3 = alg3e2(15; p=1.5, alpha=.1, delta=20, maxit=100, tau0=20.0)
ts=L"\tau_0"
as=L"\alpha"
plot(aout3.reshist,"k-")
xlabel("iterations")
ylabel("residual norm")
AlgNum="Alg 3"
if notebook
ptex="Example 2 "*AlgNum
title(ptex)
end
end

