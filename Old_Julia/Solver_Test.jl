function Solve_Report(p=.8; deform=true, maxit=1000, t=.1)
NLIP_Chen = setup_chen(p)
Solve_Report(NLIP_Chen; deform=deform, maxit=maxit, t=t)
end

function vv(N,NLIP::NonLipProblem;m=2, deform=true, t=.1, maxit=200)
h=1.0/(1.0+N); hm2=h^-2; x=h:h:1.0-h;
p=NLIP.p
pdata=setdata(x,NLIP; deform=deform, t=t)
normout=vv_body(N,pdata; m=m, maxit=maxit, t=t)
return normout
end


function vv(N,p=.8; m=2, deform=true, t=.1, maxit=200)
NLIP_Chen = setup_chen(p)
normout=vv(N, NLIP_Chen; m=m, deform=deform, t=t, maxit=maxit)
return normout
end

function vv_body(N, pdata; m=4, maxit=1000, t=.1)
u1e=reshape(pdata.ue,N*N)
aout=Solver_Test(N,pdata; m=m, maxit=maxit, t=t)
normout=norm(u1e-aout.solution)/norm(u1e)
u1x=aout.solution
g1 = Geval(u1x,pdata)
g2 = Geval(g1,pdata)
gout1 = u1e-g1 
gout2 = u1e-g2
gnrm1=norm(gout1,Inf)
gnrm2=norm(gout2,Inf)
println("N1 = $gnrm1; N2=$gnrm2")
s2d=reshape(aout.solution,(N,N))
subplot(1,2,1)
mesh(s2d-pdata.ue)
title("error")
subplot(1,2,2)
mesh(s2d)
title("Solution")
return normout
end


function Solver_Test(N,pdata; m=0, maxit=20,t=.1)
p=pdata.p
h=1.0/(1.0+N)
hm2=h^-2
x=h:h:1.0-h
Vstore=zeros(N*N,3*m+4)
uefun=pdata.uefun
#u01dx=pde_init(N,uefun,p)
r0=zeros(N*N)
u0d=Geval(r0,pdata)
u01d=Geval(u0d,pdata)
#pdata=setdata(x,p;deform=deform, t=t)
PH=zeros(N*N)
uin = copy(u01d)
aaout=aasol(HFix!, u01d, m, Vstore; pdata=pdata, maxit=maxit, 
           rtol=1.e-8, atol=1.e-8)
return aaout
end

function Solve_Report(NLIP::NonLipProblem; deform=true, maxit=1000, t=.1)
Nvals=[30, 40, 50, 60]
mvals=[0, 1, 2, 4]
fignum=1
fmtplot = ["k-", "k--", "k-.", "k:"]
for N in Nvals 
h=1.0/(1.0+N); x=h:h:1.0-h;
p=NLIP.p
pdata=setdata(x,NLIP; deform=deform, t=t)
subplot(2,2,fignum)
plotval=1
pname=NLIP.pname
for m in mvals
aaout=Solver_Test(N, pdata; m=m, maxit=maxit, t=t)
hlen=length(aaout.history)
rhist=aaout.history
rhist ./= rhist[1]
semilogy(rhist,fmtplot[plotval])
plotval += 1
end
n=N*N
titlestring=set_titlestring(n, p, t, pname, deform)
title(titlestring)
mv1=mvals[1]
mv2=mvals[2]
mv3=mvals[3]
mv4=mvals[4]
legend(["m=$mv1","m=$mv2","m=$mv3","m=$mv4"])
fignum += 1
end
end

function set_titlestring(n, p, t, pname, deform)
nval=@sprintf("%4d",n)
pval=@sprintf("%5.1f",p)
tval=@sprintf("%5.3f",t)
if deform
titlestring= "n =" * nval * "; $pname = "* pval * "; t = " * tval * "*h*h"
else
titlestring= "n =" * nval * "; $pname = "* pval * "; t = " * tval
end
return titlestring
end
