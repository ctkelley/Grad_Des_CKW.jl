module Grad_Des_CKW

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
    #
    # build the exact solution into the right side to
    # enable plotting the errors
    #
    rhs::Vector
    rhsfun::Function
    uefun::Function
    # # bvec encodes boundary data
    #
    bvec::Vector
    #
    # problem parameters
    #
    p::Real
    nu::Real
    #
    # string to annotate the polt
    #
    pname::String
end

#function NonLipProblemSet(nlfun, rhsfun, uefun, bcfun, p, nu, pname)
#     return NonLipProblem(nlfun, rhsfun, uefun, bcfun, p, nu, pname)
#end

include("Tools/fprintTeX.jl")
include("Tools/plothist.jl")
include("Analytic_Solution/Exact.jl")
include("Problem_Data/NL_Equation.jl")
include("Problem_Data/boundary.jl")
include("Problem_Data/build_problem.jl")
include("Algorithms/proj0.jl")
include("Algorithms/fobj.jl")
include("Algorithms/alg1.jl")
include("Algorithms/Alg1_test.jl")

export setup_chen, NonLipProblem, build_problem, alg1
export tau_test1, p_test1


end
