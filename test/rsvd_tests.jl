using RNLA
using Test

X = rand(3,3)
rsvd(X,1) == 3

@testset "my_f" begin
    @test my_f(2,1) == 7
    @test my_f(2,3) == 13
    @test my_f(1,3) == 11
end

@testset "rsvd" begin
    X = rand(3,3)
    @test rsvd(X,1) == 3
end
