#
# Make the figures from example 1 for showing
# in a notebook or the REPL
#
function Example1()
println("Figure 1 (a) and (b)")
figure(2)
n=15
subplot(1,2,1)
tau_test1(n; nu = 0.5, p = 0.5, maxit = 20000)
PyPlot.title("Fig 1 (a)")
subplot(1,2,2)
p_test1(n; nu = 0.5, tau0 = 0.01, algfun=alg1)
PyPlot.title("Fig 1 (b)")
end
