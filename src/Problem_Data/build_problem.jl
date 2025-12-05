function build_problem(n, uex; p=.5, nu=.5)
#
# build rhs and boundary conditions
#
h=1.0/(1.0+n)
N=n*n
#rhs=ones(N)
#rhs2d=reshape(rhs,(n,n))
D2=Lap2d(n)
X=h:h:1.0-h
uex2d=zeros(n,n)
uex2d .= [uex(x,y) for x in X, y in X]
uex1d = reshape(uex2d,(N,1))
#
# Now fix the boundary
#
bvec = zeros(N)
bvec .= fix_rhs!(bvec, uex)
#
# Does initial iterate satisfy the bc?
#
u0 = D2\bvec
u02d = reshape(u0,(n,n))
#figure(1)
#mesh(u02d)
#figure(2)
#mesh(u02d-uex2d)
nlterm = nu * uex1d.^p
rhs_eg1=D2*uex1d - bvec + nlterm
lapex=-[lapeval_chen2d(x,y) for x in X, y in X];
lapex1d = reshape(lapex,(N,1))
rhs_exact = lapex1d + nlterm
return(bvec=bvec, u0=u0, uex1d=uex1d, rhs_eg1=rhs_eg1, rhs_exact,
       D2=D2)
end

