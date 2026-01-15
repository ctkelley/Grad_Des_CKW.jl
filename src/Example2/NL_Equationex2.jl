#
# Residual
#
function FEX2(u, pdata)
    #
    # Problem parameters
    #
    alpha=pdata.alpha
    p=pdata.p
    delta=pdata.delta
    #
    # boundary data
    #
    bvec=pdata.bvec
    #
    # negative Laplacian
    #
    D2 = pdata.D2
    #
    FG = D2*u + nlterm_ex2.(u, p, alpha, delta) - bvec
    return FG
end
#
# This is the nonlinear term in the operator.
# the parameter delta depends on the example
#
function nlterm_ex2(u, p, alpha, delta)
    nlout1=(delta*abs.(u).^alpha)*sign.(u)
    nlout2=abs.(u).^(p-1) .* u
    nlout = nlout1 - nlout2
    return nlout
end

#
# objective function
#
function fobj2(u, pdata)
p=pdata.p
alpha=pdata.alpha
delta=pdata.delta
fcons=dot(u,pdata.bvec)
# Linear term
D2=pdata.D2
fl = 0.5*(u'*D2*u)
#
fnl1=(delta/(1.0+alpha)) * sum(abs.(u).^(alpha+1.0))
fnl2=(1.0/(p+1)) * sum(abs.(u).^(p+1))
fobj = fl-fcons + fnl1 - fnl2
end

