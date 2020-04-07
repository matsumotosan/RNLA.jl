using RNLA, Test, LinearAlgebra

@testset "rsvd_test1" begin
    X = [1 2 3 4; 5 6 7 8]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X, 2)

    @test norm(abs.(u1) - abs.(u2)) < sqrt(eps())
    @test norm(abs.(v1) - abs.(v2)) < sqrt(eps())
    @test norm(abs.(s1) - abs.(s2)) < sqrt(eps())
end

@testset "rsvd_test2" begin
    X = [1 2 3; 4 5 6; 7 8 9]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X, 3)

    @test norm(abs.(u1) - abs.(u2)) < sqrt(eps())
    @test norm(abs.(v1) - abs.(v2)) < sqrt(eps())
    @test norm(abs.(s1) - abs.(s2)) < sqrt(eps())
end

@testset "rsvd_test3" begin
    X = [1 2; 3 4; 5 6; 7 8; 9 10; 11 12]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X, 2)

    @test norm(abs.(u1) - abs.(u2)) < sqrt(eps())
    @test norm(abs.(v1) - abs.(v2)) < sqrt(eps())
    @test norm(abs.(s1) - abs.(s2)) < sqrt(eps())
end

@testset "rsvd_test4" begin
    m = 1000
    k = 500
    X = rand(m, m) * rand(m, k)

    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X, k)

    @test norm(abs.(u1) - abs.(u2)) < sqrt(eps())
    @test norm(abs.(v1) - abs.(v2)) < sqrt(eps())
    @test norm(abs.(s1) - abs.(s2)) < sqrt(eps())
end
