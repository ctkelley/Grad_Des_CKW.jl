using Test, Grad_Des_CKW
import Grad_Des_CKW: LSolve

include("Discretization/Lap.jl")

@testset "Discretization" begin
    @test Lap()
end
