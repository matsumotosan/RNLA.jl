# Randomized SVD

function rsvd(X::Array{T,2}, k::Int, p::Int=1, q::Int=5) where {T<:Number}
    Q, B = rqb(X, k, p, q)
    U, S, V = svd(B)
    U = Q * U

    return U[:, 1:k], S[1:k], V[:, 1:k]
end
