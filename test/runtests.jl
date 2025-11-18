using Test, Grad_Des_CKW

include("Discretization/Lap.jl")

@testset "Discretization" begin
    @test Lap()
end
