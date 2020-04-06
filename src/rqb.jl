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

function sub_iterations!(X,
                         Y,
                         q::Int)

    for i = 1:q
          Y = X * qr(X' * qr(Y).Q).Q
    end
end
