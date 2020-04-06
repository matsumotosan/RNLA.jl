# Randomized CUR decomposition

function rcur(X,
              k::Int,
              p::Int=10,
              q::Int=0,
              idx_only::Bool=false,
              random::Bool=true)

    C, Z, J = rid(X, k, p, q)
    F = qr(C')
end
