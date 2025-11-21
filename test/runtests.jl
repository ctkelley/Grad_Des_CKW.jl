using Test, Grad_Des_CKW
using SIAMFANLEquations
using SIAMFANLEquations.Examples
import Grad_Des_CKW: LSolve, add_boundary!
import SIAMFANLEquations.Examples: Lap2d

# Test for discretization,boundary conditions,Laplacian of exact solution,
# and truncation error of gradient when applied to exact solution
#
include("Discretization/Lap.jl")

@testset "Discretization" begin
    @test Lap()
end
