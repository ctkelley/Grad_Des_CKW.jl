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

include("Tools/fprintTeX.jl")
include("Tools/plothist.jl")
include("Analytic_Solution/Exact.jl")
include("Problem_Data/NL_Equation.jl")
include("Problem_Data/boundary.jl")
include("Problem_Data/build_problem.jl")
include("Algorithms/proj0.jl")
include("Algorithms/fobj.jl")
include("Algorithms/alg1.jl")
include("Algorithms/Alg_test.jl")

export build_problem, alg1
export tau_test1, p_test1

end
