using RNLA, Test, LinearAlgebra

@testset "rpca_test1" begin
    m = 100
    k = 10
    X = rand(m, k) * rand(k, m)
    U, S, W1 = svd(X)
    Z1 = U * S
    Λ1 = S'S ./ (m - 1)

    W2, Λ2, Z2 = rpca(X, k)

    @test norm(abs.(W1) - abs.(W2)) < sqrt(eps())
    @test norm(abs.(Λ1) - abs.(Λ2)) < sqrt(eps())
    @test norm(abs.(Z1) - abs.(Z2)) < sqrt(eps())
end

@testset "rpca_test2" begin
end
