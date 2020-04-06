using RNLA
using Test
using LinearAlgebra

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

X = [1 2 3; 4 5 6; 7 8 9; 10 11 12; 13 14 15]
u1, s1, v1 = svd(X)
u2, s2, v2 = rsvd(X, 3)

@testset "rsvd_test3" begin
    X = [1 2 3; 4 5 6; 7 8 9; 10 11 12]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X, 3)

    @test norm(abs.(u1) - abs.(u2)) < sqrt(eps())
    @test norm(abs.(v1) - abs.(v2)) < sqrt(eps())
    @test norm(abs.(s1) - abs.(s2)) < sqrt(eps())
end

@testset "rsvd_test4" begin
    m = 100
    n = 25
    U = qr(rand(m,n)).Q
    k = 10
    x = collect(1:k)
    s = 1000 * exp.(-x)
    append!(s, zeros(n - length(s)))
    S = Diagonal(s)
    S = [S; zeros(m - n, n)]
    Vt = qr(rand(n,n)).Q

    X = U * (S * Vt)

    Ur, Sr, Vtr = rsvd(X, k)

    @test norm(abs.(U[:, 1:k]) - abs.(Ur)) < eps()
    @test norm(abs.(Vt[:, 1:k]) - abs.(Vtr)) < eps()
    @test norm(abs.(s[1:k]) - abs.(Sr)) < eps()
end
