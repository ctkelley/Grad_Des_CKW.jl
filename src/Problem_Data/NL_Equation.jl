#
# Residual 
#
function FChen(u,pdata)
   FC = FG(u,pdata) - pdata.rhs_eg1
   return FC
end
#
# Generic residual
#
function FGen(u, pdata)
#
# Problem parameters
#
   nu=pdata.nu
   p=pdata.p
#
# boundary data
#
   bvec=pdata.bvec
#
# negative Laplacian
#
   D2 = pdata.D2
#
   FG = D2*u + nlterm_chen.(u,p,nu) - bvec
   return FG
end
#
# This is the nonlip term in the operator.
# the parameter delta depends on the example
#
function nlterm_chen(u,p,nu)
delta=0.0
nlout=nu*u^p- delta*abs(u)^(p-1)
return nlout
end

