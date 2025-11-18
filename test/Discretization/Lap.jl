function Lap(n=15,p=0.0)
     rhs=zeros(n*n)
     uexfun(x,p) = 1.0
     uev = uexfun.(rhs,p)
     Lv = LSolve(rhs, uexfun)
     nerr = norm(uev-Lv,Inf)
     println(norm(uev-Lv,Inf))
     lapok = (nerr < 1.e-14)
     return lapok
end
