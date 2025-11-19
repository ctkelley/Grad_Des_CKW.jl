using Test, Grad_Des_CKW
using SIAMFANLEquations
using SIAMFANLEquations.Examples
import Grad_Des_CKW: LSolve
import SIAMFANLEquations.Examples: Lap2d

include("Discretization/Lap.jl")

@testset "Discretization" begin
    @test Lap()
end
