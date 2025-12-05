#
# These functions build the data structure for the examples
# The argument deform is true for now. deform=false will
# be for the integral equation formulation.
#
function setup_chen(p)
    ChenProblem=NonLipProblemSet(nlterm_chen, rhsfun_chen, uefun_chen, bcfun_chen, p, "p")
end
#
function setdata(x, NLIP::NonLipProblem; deform = true, t = 0.1)
    nlterm=NLIP.nlterm
    rhsfun=NLIP.rhsfun
    uefun=NLIP.uefun
    bcfun=NLIP.bcfun
    p=NLIP.p
    nu=NLIP.nu
    pname=NLIP.pname
    N = length(x)
    D2 = Lap2d(N)
    h = 1.0 / (N + 1.0)
    hm2 = h^-2
    r = zeros(N, N)
    r = rad!(r, x, x)
    delta = 1.0
    ue=uefun(r, p)
    v=copy(ue)
    v.=rhsfun.(ue, r, p)
    #if deform
    d2fix!(v, x, p, hm2, uefun)
    #end
    return (
        r = r,
        v = v,
        ue = ue,
        p = p,
        nu = nu,
        D2 = D2,
        N = N,
        deform = deform,
        t = t,
        rhsfun = rhsfun,
        nlterm = nlterm,
        uefun = uefun,
        pname = pname,
    )
end
