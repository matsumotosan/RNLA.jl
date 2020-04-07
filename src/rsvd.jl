# Randomized SVD

function rsvd(X,    # (m,n) array
              k::Int,           # target rank
              p::Int=1,         # oversampling parameter
              q::Int=5)         # power iterations parameter

    Q, B = rqb(X, k, p, q)
    U, S, V = svd(B)
    U = Q * U

    return U[:, 1:k], S[1:k], V[:, 1:k]
end
