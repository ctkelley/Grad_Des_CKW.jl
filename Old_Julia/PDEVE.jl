module PDEVE

using LinearAlgebra
using SIAMFANLEquations
using SIAMFANLEquations.Examples
using PyPlot
using LaTeXStrings
using Printf
import SIAMFANLEquations.Examples.Lap2d
import SIAMFANLEquations.Examples.fish2d
import SIAMFANLEquations.Examples.fishinit

struct NonLipProblem
    nlterm::Function
    rhsfun::Function
    uefun::Function
    bcfun::Function
    p::Real
    pname::String
end

function NonLipProblemSet(nlfun, rhsfun, uefun, bcfun, p, pname)
     return NonLipProblem(nlfun, rhsfun, uefun, bcfun, p, pname)
end

include("fprintTeX.jl")
#include("nldata.jl")
include("setdata.jl")
#include("Test_Suite_1.jl")
include("Solver_Test.jl")
include("Generic_Functions.jl")
include("Chen_Example.jl")

export setdata, Heval, Chen_Table, restab, Solver_Test, Solve_Report, vv
export setup_chen, NonLipProblem


end
