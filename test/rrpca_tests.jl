using RNLA, Test, LinearAlgebra, SparseArrays

@testset "rrpca_test1" begin
    m = 100
    k = 10
    n = 100
    p = 0.1

    L1 = rand(m, k) * rand(k, n)
    S1 = sprandn(m, n, p)
    A = L1 + S1 + rand(m, n)

    L2, S2, E2 = rrpca(A)

    @test norm(abs.(L1) - abs.(L2)) < sqrt(eps())
    @test norm(abs.(S1) - abs.(S2)) < sqrt(eps())
end
