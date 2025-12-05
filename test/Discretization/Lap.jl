# Collect the rest results for Laplacian
#
function Lap(n = 15)
    #
    # full precision solution for trivial problem
    #
    onesok = Lap_oneA(n)
    #
    # two point grid refinement study to make sure bc work correctly
    #
    t2derr1 = Lap_two(n)
    n2=2*(n+1)-1
    t2derr2 = Lap_two(n2)
    rat=t2derr1/t2derr2
    twosok = (rat > 3.5) && (rat < 4.5)
    return (onesok && twosok)
end

#
# Solve -Lap u = 0, u=1 on boundary. Expect full precision.
#
function Lap_oneA(n = 15)
    N=n*n
    rhs2=zeros(n, n)
    h=1.0/(n+1.0)
    X=h:h:(1.0-h)
    u2d(x, y)=1.0
    uex2d = [u2d(x, y) for x in X, y in X]
    uex = reshape(uex2d, (n*n, 1))
    rhs = zeros(n*n, 1)
    Lv = LSolve(rhs, u2d)
    nerr=norm(Lv - uex, Inf)
    lapok = (nerr < 1.e-14)
    return lapok
end

#
# Solver for grid refinement study for Lap using boundary conditions
#
function Lap_two(n = 15)
    h=1.0/(n+1.0)
    X=h:h:(1.0-h)
    uex = [u2d(x, y) for x in X, y in X]
    lex = [Lapud2(x, y) for x in X, y in X]
    rhs = reshape(uex, (n*n, 1))
    lex1d = reshape(lex, (n*n, 1))
    D2 = Lap2d(n)
    lexap=D2*rhs
    test1=copy(lexap)
    ulow=u2d.(X, 0.0)
    uhigh=u2d.(X, 1.0)
    uleft=u2d.(0.0, X)
    uright=u2d.(1.0, X)
    add_boundary!(lexap, uleft, uright, ulow, uhigh)
    derr = norm(lexap - lex1d, Inf)
    return derr
end

#
# Easy 2d test problem
#
function u2d(x, y)
    u2d = x * exp(y)
    return u2d
end

#
# negative Laplacian of u2d
#
function Lapud2(x, y)
    lu2d = -x*exp(y)
end
