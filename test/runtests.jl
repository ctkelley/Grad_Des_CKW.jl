using Test, Grad_Des_CKW
using SIAMFANLEquations
using SIAMFANLEquations.Examples
import Grad_Des_CKW: LSolve, add_boundary!, lapeval_ex12d, uefun_ex12d
import Grad_Des_CKW: fix_rhs!, u2dex1, fobj, FEX1
import SIAMFANLEquations.Examples: Lap2d

# Test for discretization,boundary conditions,Laplacian of exact solution,
# and truncation error of gradient when applied to exact solution
#
include("Discretization/Lap.jl")
include("Discretization/Test_Eg1.jl")
include("Gradient/fdgrad.jl")

@testset "Discretization" begin
    @test Lap()
    @test Test_Eg1()
end

@testset "Gradient" begin
   @test fdgrad()
end

