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
include("Algorithms/Alg_Structs.jl")
include("Algorithms/proj0.jl")
include("Algorithms/fobj.jl")
include("Algorithms/alg1e1.jl")
include("Algorithms/alg1.jl")
include("Algorithms/alg2.jl")
include("Algorithms/alg2e1.jl")
include("Algorithms/Alg_test.jl")
include("Figures/Figures_Alg1.jl")

export build_problem, alg1e1, tau_test1, p_test1, alg2e1
export Figure1_2a, Figure1_2b

end
