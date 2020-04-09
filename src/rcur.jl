# Randomized CUR decomposition

function rcur(X,
              k::Int,
              p::Int=10,
              q::Int=0)

    C, Z, J = rid(X, k, p, q)
    F = qr(C', pivot=true)
    idx = F.p(1:k)
    R = X[idx, :]

    return C, Z * pinv(R), R
end
