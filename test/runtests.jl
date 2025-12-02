using Test, Grad_Des_CKW
using SIAMFANLEquations
using SIAMFANLEquations.Examples
import Grad_Des_CKW: LSolve, add_boundary!, lapeval_chen2d, uefun_chen2d
import Grad_Des_CKW: fix_rhs!, u2dex1
import SIAMFANLEquations.Examples: Lap2d

# Test for discretization,boundary conditions,Laplacian of exact solution,
# and truncation error of gradient when applied to exact solution
#
include("Discretization/Lap.jl")
include("Discretization/Test_Eg1.jl")

@testset "Discretization" begin
    @test Lap()
    @test Test_Eg1()
end


