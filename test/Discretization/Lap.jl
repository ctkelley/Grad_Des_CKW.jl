function Lap(n=15,p=0.0
   onesok = Lap_one(n,p)
   twook = Lap_two(n,p)
end

function Lap_one(n=15,p=0.0)
     rhs=zeros(n*n)
     uexfun(x,p) = 1.0
     uev = uexfun.(rhs,p)
     Lv = LSolve(rhs, uexfun)
     nerr = norm(uev-Lv,Inf)
     println(norm(uev-Lv,Inf))
     lapok = (nerr < 1.e-14)
     return lapok
end

function Lap_two(n=15, p=0.0)
  h=1.0/(n+1.0)
  X=h:h:1.0-h
  uex = [u2d(x, y, p) for x in X, y in X]
  lex = [Lapud2(x,y) for x in X, y in X]
  rhs = reshape(uex, (n*n,1))
  lex1d = reshape(lex,(n*n,1))
  D2 = Lap2d(n)
  lexap=D2*rhs
  derr = norm(lexap - lex1d,Inf)
  println(derr)
end 

#
# Easy 2d test problem
#
function u2d(x,y,p)
  u2d = x * exp(y)
  return u2d
end

#
# negative Laplacian of u2d
#
function Lapud2(x,y)
  lu2d = -x*exp(y)
end 
