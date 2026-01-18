module Grad_Des_CKW

using LinearAlgebra
using SIAMFANLEquations
using SIAMFANLEquations.Examples
#using PyPlot
using PythonPlot;
using LaTeXStrings
using Printf
import SIAMFANLEquations.Examples.Lap2d
import SIAMFANLEquations.Examples.fish2d
import SIAMFANLEquations.Examples.fishinit

include("Tools/fprintTeX.jl")
include("Tools/plothist.jl")
include("Analytic_Solution/Exact.jl")
include("Problem_Data/NL_Equationex1.jl")
include("Problem_Data/boundary.jl")
include("Problem_Data/build_problemex1.jl")
include("Algorithms/Alg_Structs.jl")
include("Algorithms/proj0.jl")
include("Algorithms/fobj.jl")
include("Algorithms/alg1.jl")
include("Algorithms/alg1examples.jl")
include("Algorithms/alg2.jl")
include("Algorithms/alg3.jl")
include("Algorithms/alg2e1.jl")
include("Algorithms/alg3e1.jl")
include("Algorithms/Alg_test.jl")
include("Figures/Figures_CKW.jl")
include("Figures/Example2.jl")
include("Example2/build_problem2.jl")
include("Example2/NL_Equationex2.jl")

export build_problem, alg1e1, tau_test1, p_test1, alg2e1, alg2, alg3
export alg2e1, alg3e1, res_test1
export Figure1_2a, Figure1_2b, Figure3, Figure4_5a, Figure4_5b, Figure6ab
export Example2a, Example2b
export build_problem2, proj2, alg1e2, FEX2, fobj2, alg3e2
export Alg3_alpha_test
end
