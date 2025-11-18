using Test, Grad_Des_CKW

include("Discretizations")

@testset "Discretization" begin
    @test Lap()
end
