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

