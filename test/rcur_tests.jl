using RNLA, Test, LinearAlgebra

@testset "rcur_test1" begin
    m = 100
    n = 50
    k = 4

    C = rand(m, k)
    U = rand(k, k)
    R = rand(k, n)
    A = C * U * R

    C1, U1, R1 = rcur(A)

    @test norm(C - C1) <= sqrt(eps())
    @test norm(U - U1) <= sqrt(eps())
    @test norm(R - R1) <= sqrt(eps())
end

@testset "rcur_test2" begin
end
