# Randomized PCA

function rpca(X,        # (m,n) array
              k::Int,               # target rank
              p::Int=10,            # oversampling parameter
              q::Int=2)             # power iteration parameter

    m, n = size(X)
    U, Σ, W = rsvd(X, k, p, q)

    return W, Σ'Σ ./ (m - 1), U * Σ
end
