# Randomized interpolative decomposition

using LowRankApprox

function rid(X,
             k::Int,
             p::Int=10,
             q::Int=0)

    Q, B = rqb(X, k, p, q)
    Z, j = id(B, k)
    C = A[:, j]

    return A[:, j], Z, j
end
