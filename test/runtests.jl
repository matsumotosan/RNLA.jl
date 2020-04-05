using RNLA
using Test

@testset "RNLA.jl" begin
    @test my_f(2,1) == 7
    @test my_f(2,3) == 13
    @test my_f(1,3) == 11
end

@test "rsvd" begin
    @test 1 == 1
end
