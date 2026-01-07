function ex2t(n,pdata)
u=pdata.u0
del=1.e-4
for itest=1:10
pu=rand(n*n)
du=del*pu
fp=fobj2(u + du,pdata)
fm=fobj2(u - du,pdata)
df=.5*(fp-fm)/del
de=dot(FEX2(u,pdata),pu)
println(norm(df-de,Inf))
end
end
