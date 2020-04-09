using RNLA, Test, LinearAlgebra

@testset "rnmf_test1" begin
    m = 50
    k = 10
    n = 30
    W = rand(1:100, (m, k))
    H = rand(1:100, (k, n))
    X = W * H

    rW, rH = rnmf(X, k)
    @test norm(rW - W) <= sqrt(eps())
    @test norm(rH - H) <= sqrt(eps())
end

@testset "rnmf_test2" begin
    m = 100
    k = 5
    n = 15
    W = rand(1:100, (m, k))
    H = rand(1:100, (k, n))
    X = W*H

    rW, rH = rnmf(X, k)
    @test norm(rW - W) <= sqrt(eps())
    @test norm(rH - H) <= sqrt(eps())
end
