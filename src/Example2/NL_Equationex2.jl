#
# Residual
#
function FEX2(u, pdata)
    #
    # Problem parameters
    #
    nu=pdata.nu
    p=pdata.p
    lambda=pdata.lambda
    #
    # boundary data
    #
    bvec=pdata.bvec
    #
    # negative Laplacian
    #
    D2 = pdata.D2
    #
    FG = D2*u + nlterm_ex2.(u, p, nu, lambda) - bvec
    return FG
end
#
# This is the nonlinear term in the operator.
# the parameter delta depends on the example
#
function nlterm_ex2(u, p, nu, lambda)
    nlout1=(lambda*abs.(u).^nu) 
    nlout2=abs.(u).^p .* u
    nlout = nlout1 - nlout2
    return nlout
end

#
# objective function
#
function fobj2(u, pdata)
p=pdata.p
nu=pdata.nu
lambda=pdata.lambda
fcons=dot(u,pdata.bvec)
# Linear term
D2=pdata.D2
fl = 0.5*(u'*D2*u)
#
fnl1=(lambda/(1.0+nu)) * sum(abs.(u).^(nu+1.0))
fnl2=(1.0/p) * sum(abs.(u).^p)
fobj = fl-fcons + fnl1 - fnl2
end

