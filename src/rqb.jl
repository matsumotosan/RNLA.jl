# Randomized QB decomposition

function rqb(X,
             k::Int,
             p::Int,
             q::Int)

    m, n = size(X)
    Y = X * randinit(n, k + p)
    sub_iterations!(X, Y, q)
    Q = qr(Y).Q

    return Q, Q' * X
end
