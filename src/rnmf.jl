# Randomized nonnegative matrix factorization

function rnmf(X,
              k::Int,
              p::Int=5,
              q::Int=1)

    m, n = size(X)
    P = rand(n, k + p)
    Y = X * P
    sub_iterations!(X, Y, q)
    Q = qr(Y).Q
    B = Q' * X

    W = rand(m, k)
    Wr = rand(k + p, k)
    H = rand(k, n)

    HALS!()

    return W, H
end

function HALS!(W, Wr, H, k::Int)

end
