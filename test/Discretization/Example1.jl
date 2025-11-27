function Example1_Lap(n=7)
#
# Compare finite difference Laplacian for the analytic solution
# to the analytic expression. You will not get second order 
# accuracy because the solution is not smooth enough to support that.
#
dnrm7=lap_example1(n)
np=2*(n+1) - 1
dnrm15=lap_example1(np)
ratnrm=dnrm7/dnrm15
Ex1Lapok = (ratnrm > 1.5) && (ratnrm < 2.5)
return Ex1Lapok
end

function lap_example1(n;p0=.5)
N=n*n
h=1.0/(n+1.0)
X=h:h:1.0-h
#
# Exact negative Laplacian
#
lapex=-[lapeval_chen2d(x,y) for x in X, y in X];
lapex1d = reshape(lapex,(N,1))
#
# Fix BC for FD Laplacian
#
rhs=zeros(N)
rhs .= fix_rhs!(rhs, u2dex1;p0=p0);
ue2 = [uefun_chen2d(x,y) for x in X, y in X];
ue1d=reshape(ue2,(n*n,1))
D2 = Lap2d(n)
lapfd = D2*ue1d - rhs
DelLap = lapfd - lapex1d
delnorm=norm(DelLap,Inf)
return delnorm
end

