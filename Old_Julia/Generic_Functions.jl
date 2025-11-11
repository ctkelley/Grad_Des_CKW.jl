function HFix!(PH,uin,pdata)
deform=pdata.deform
hm2 = length(uin)
hm=sqrt(hm2)
t=pdata.t
if deform
gamma = t/hm2
PH .= (uin - gamma*Heval(uin,pdata))
else
gamma = t
PH .= Geval2(uin,pdata)
end
#PH .= proj0(uin - gamma*Heval(proj0(uin),pdata))
#PH .= (uin - gamma*Heval(uin,pdata))
end


function Heval(u,pdata)
deform=pdata.deform
v=pdata.v
p=pdata.p
N=pdata.N
D2=pdata.D2
v1=reshape(v,(N*N))
u1=reshape(u,(N*N))
nlterm=pdata.nlterm
Nval=nlterm.(proj0(u1),p)
if deform
H = D2*u1 + Nval - v1
else
H = u1 - Geval(u1,pdata)
end
return H
end

function Geval(u1,pdata)
v=pdata.v
p=pdata.p
N=pdata.N
D2=pdata.D2
v1=reshape(v,(N*N))
nlterm=pdata.nlterm
Nval=nlterm.(proj0(u1),p)
G = proj0(D2\(v1-Nval))
return G
end

function Geval2(u1,pdata)
v=pdata.v
p=pdata.p
N=pdata.N
D2=pdata.D2
t=pdata.t
M=(I + t*D2)
v1=reshape(v,(N*N))
nlterm=pdata.nlterm
Nval=nlterm.(proj0(u1),p)

G = proj0(M\(u1+ t*v1-t*Nval))
return G
end


function proj0(y)
p=max.(y, 0.0)
return p
end

function pde_init(N,uefun,p=.8)
rhs=zeros(N*N)
lapinit=PSolve(rhs,uefun,p)
return lapinit
end

function PSolve(rhs,uefun,p=.8)
n=length(rhs)
N=Int(sqrt(n))
h=1.0/(1.0+N)
hm2=h^-2
x=h:h:1.0-h
rhs2d=reshape(rhs,(N,N))
rhs2d .= d2fix!(rhs2d,x,p,hm2,uefun)
D2 = Lap2d(N)
Psol = D2\rhs
return Psol
end

function bcrad(x,p,uex,face=:low)
N=length(x)
(face == :low) && (bval=uex(x,p))
(face == :left) && (bval = uex(x,p))
z = sqrt.(x.^2 .+ 1.0)
(face == :right ) && (bval = uex(z,p))
(face == :top) && (bval = uex(z,p))
return bval
end


function d2fix!(d22d,x, p, hm2, uefun)
N=length(x)
vbclow=bcrad(x,p,uefun,:low) *hm2
vbcleft=bcrad(x,p,uefun,:left) *hm2
vbctop=bcrad(x,p,uefun,:top) *hm2
vbcright=bcrad(x,p,uefun,:right) *hm2
    d22d[:, 1] .+= vbclow
    d22d[:, N] .+= vbctop
    d22d[1, :] .+= vbcleft
    d22d[N, :] .+= vbcright
return d22d
end

function rad!(r,x,y)
N=length(x)
for j=1:N
    for i=1:N
        r[i, j] = sqrt(x[i]^2 + y[j]^2)
    end
end
return r
end

