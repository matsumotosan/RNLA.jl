using RNLA
using Test
using LinearAlgebra

@testset "rsvd_test1" begin
    X = [1 2 3 4; 5 6 7 8]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X,2)
    rtol = 1e-5

    @test isapprox(norm(u1), norm(u2))
    @test isapprox(norm(v1), norm(v2))
    @test isapprox(s1, s2, rtol=rtol)
end

@testset "rsvd_test2" begin
    X = [1 2 3; 4 5 6; 7 8 9]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X,3)
    rtol = 1e-5

    @test isapprox(norm(u1), norm(u2))
    @test isapprox(norm(v1), norm(v2))
    @test isapprox(s1, s2, rtol=rtol)
end

@testset "rsvd_test3" begin
    X = [1 2 3; 4 5 6; 7 8 9; 10 11 12]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X,3)

    @test isapprox(norm(u1), norm(u2))
    @test isapprox(norm(v1), norm(v2))
    @test isapprox(s1, s2)
end

@testset "rsvd_test4" begin
end

@testset "rsvd_test5" begin
end
