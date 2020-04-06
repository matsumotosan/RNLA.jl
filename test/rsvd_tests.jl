using RNLA
using Test
using LinearAlgebra

@testset "rsvd_test1" begin
    X = [1 2 3 4; 5 6 7 8]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X, 2)

    @test isapprox(norm(u1), norm(u2))
    @test isapprox(norm(v1), norm(v2))
    @test isapprox(s1, s2)
end

@testset "rsvd_test2" begin
    X = [1 2 3; 4 5 6; 7 8 9]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X, 3)

    @test isapprox(norm(u1), norm(u2))
    @test isapprox(norm(v1), norm(v2))
    @test isapprox(s1, s2)
end

@testset "rsvd_test3" begin
    X = [1 2 3; 4 5 6; 7 8 9; 10 11 12; 13 14 15]
    u1, s1, v1 = svd(X)
    u2, s2, v2 = rsvd(X, 3)

    @test isapprox(norm(u1), norm(u2))
    @test isapprox(norm(v1), norm(v2))
    @test isapprox(s1, s2)
end

m = 1000
n = 500
U = qr(rand(m,n)).Q
x = collect(1:100)
s = 1000 * exp.(-x)
append!(s, zeros(n - length(s)))
S = Diagonal(s)
S = [S; zeros(m - n, n)]
Vt = qr(rand(n,m)).Q

X = U * (S * Vt)

@testset "rsvd_test4" begin
    m = 1000
    n = 500
    U = qr(rand(m,n)).Q
    x = collect(1:100)
    s = 1000 * exp.(-x)
    append!(s, zeros(n - length(s)))
    S = Diagonal(s)
    S = [S; zeros(m - n, n)]
    Vt = qr(rand(n,m)).Q

    X = U * (S * Vt)

    Ur, Sr, Vtr = rsvd(X)

    @test isapprox(norm(U), norm(Ur))
    @test isapprox(norm(Vt), norm(Vtr))
    @test isapprox(S, Sr)
end

@testset "rsvd_test5" begin
end
