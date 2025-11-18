#
# This is the nonlip term in the operator.
# the parameter delta depends on the example
#
function nlterm_chen(u,p,nu)
delta=0.0
nlout=nu*u^p- delta*abs(u)^(p-1)
return nlout
end

