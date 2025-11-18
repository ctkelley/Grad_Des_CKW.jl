function Lap(n=15,p=0.0)
     rhs=zeros(n*n)
     uexfun(x,p) = 1.0
     uev = uexfun.(rhs,p)
     Lv = LSolve(rhs, uexfun)
     println(norm(uev-Lv,Inf))
end

#
# Solve the BVP and compare to the exact solution
#
function LSolve(rhs,uefun,p=.8)
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


#
# Set up the right side to fix the bc
# This with the doubly-indexed form
#
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


function bcrad(x,p,uex,face=:low)
N=length(x)
(face == :low) && (bval=uex(x,p))
(face == :left) && (bval = uex(x,p))
z = sqrt.(x.^2 .+ 1.0)
(face == :right ) && (bval = uex(z,p))
(face == :top) && (bval = uex(z,p))
return bval
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

