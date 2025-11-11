function setdata(x,p; deform=true, t=.1)
CHNLIP=setup_chen(p)
pdata=setdata(x,CHNLIP; deform=deform,t=t)
return pdata
end

function xsetdata(x,p;deform=true, t=.1, 
     rhsfun=rhsfun_chen, nlterm=nlterm_chen, uefun=uefun_chen, pname="p")
N = length(x)
D2 = Lap2d(N)
h = 1.0 / (N + 1.0)
hm2 = h^-2
r = zeros(N, N)
r = rad!(r,x,x)
delta = 1.0
ue=uefun(r,p)
v=copy(ue)
v.=rhsfun.(ue, r, p)
#if deform
d2fix!(v, x, p, hm2, uefun)
#end
return (r=r, v=v, ue=ue, p=p, D2=D2, N=N, deform=deform, 
        t=t, rhsfun=rhsfun, nlterm=nlterm, uefun=uefun, pname=pname)
end

function setdata(x,NLIP::NonLipProblem; deform=true,t=.1)
nlterm=NLIP.nlterm
rhsfun=NLIP.rhsfun
uefun=NLIP.uefun
bcfun=NLIP.bcfun
p=NLIP.p
pname=NLIP.pname
N = length(x)
D2 = Lap2d(N)
h = 1.0 / (N + 1.0)
hm2 = h^-2
r = zeros(N, N)
r = rad!(r,x,x)
delta = 1.0
ue=uefun(r,p)
v=copy(ue)
v.=rhsfun.(ue, r, p)
#if deform
d2fix!(v, x, p, hm2, uefun)
#end
return (r=r, v=v, ue=ue, p=p, D2=D2, N=N, deform=deform,
        t=t, rhsfun=rhsfun, nlterm=nlterm, uefun=uefun, pname=pname)
end
