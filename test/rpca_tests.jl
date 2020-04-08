using RNLA, Test, LinearAlgebra

@testset "rpca_test1" begin
    m = 10
    k = 10
    X = rand(m, k)
    U, S, W1 = svd(X)
    Z1 = U * Diagonal(S)
    Λ1 = (S .^ 2) ./ (m - 1)

    W2, Λ2, Z2 = rpca(X, k)

    @test norm(abs.(W1) - abs.(W2)) < sqrt(eps())
    @test norm(abs.(Λ1) - abs.(Λ2)) < sqrt(eps())
    @test norm(abs.(Z1) - abs.(Z2)) < sqrt(eps())
end

@testset "rpca_test2" begin
    m = 100
    n = 1000
    k = 50
    X = rand(m, n)
    U, S, W1 = svd(X)
    W1 = W1[:, 1:k]
    Z1 = U[:, 1:k] * Diagonal(S[1:k])
    Λ1 = (S[1:k] .^ 2) ./ (m - 1)

    W2, Λ2, Z2 = rpca(X, k)

    @test norm(abs.(W1) - abs.(W2)) < sqrt(eps())
    @test norm(abs.(Λ1) - abs.(Λ2)) < sqrt(eps())
    @test norm(abs.(Z1) - abs.(Z2)) < sqrt(eps())
end

@testset "rpca_test3" begin
    m = 1000
    n = 100
    k = 50
    X = rand(m, n)
    U, S, W1 = svd(X)
    W1 = W1[:, 1:k]
    Z1 = U[:, 1:k] * Diagonal(S[1:k])
    Λ1 = (S[1:k] .^ 2) ./ (m - 1)

    W2, Λ2, Z2 = rpca(X, k)

    @test norm(abs.(W1) - abs.(W2)) < sqrt(eps())
    @test norm(abs.(Λ1) - abs.(Λ2)) < sqrt(eps())
    @test norm(abs.(Z1) - abs.(Z2)) < sqrt(eps())
end
