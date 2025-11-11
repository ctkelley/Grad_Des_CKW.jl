function setup_chen(p)
ChenProblem=NonLipProblemSet(nlterm_chen,rhsfun_chen,uefun_chen,
       bcfun_chen,p,"p")
end

function nlterm_chen(u,p)
lambda=1.0
delta=0.0
nlout=lambda*(9.0*u^p)/(1.0-p)^2 + delta*exp(-u)
return nlout
end

function lapeval_chen(r,p)
sigma=2.0*p/(1.0 - p)
mask = (r .> 1.0/3.0)
T = mask .* (3.0 * r .- 1.0)*.5
#u=(r-1.0/3.0)*T^sigma
u=(2.0/3.0)*T^(sigma+1.0)
dudr = (sigma+1.0) * T^sigma
du2dr2 = sigma * (sigma+1.0) *1.5 * T^(sigma-1.0)
lapu = du2dr2 + (dudr/r)
end

function rhsfun_chen(ue,r,p)
mlap = -lapeval_chen(r,p)
nl=nlterm_chen.(ue,p)
rhs2d=mlap+nl
return rhs2d
end

function uefun_chen(r,p)
sigma=2.0*p/(1.0 - p)
T = zeros(size(r))
mask = (r .> 1.0/3.0)
T = abs.(mask .* (3.0 * r .- 1.0))*.5
ue2=(2.0/3.0)*T.^(sigma+1.0)
return ue2
end

function bcfun_chen(r,p)
bc=uefun_chen(r,p)
return bc
end
