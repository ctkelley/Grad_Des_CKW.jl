#
# Residual 
#
function FEX1(u, pdata)
    FC = FGen(u, pdata) - pdata.rhs_eg1
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
    p=pdata.alpha
    #
    # boundary data
    #
    bvec=pdata.bvec
    #
    # negative Laplacian
    #
    D2 = pdata.D2
    #
    FG = D2*u + nlterm_ex1.(u, p, nu) - bvec
    return FG
end
#
# This is the nonlip term in the operator.
# the parameter delta depends on the example
#
function nlterm_ex1(u, p, nu)
    nlout=nu*u^p
    return nlout
end
