# Randomized nonnegative matrix factorization

function rnmf(X::Array{T,2},
              k::Int,
              p::Int=5,
              q::Int=1,
              max_iter::Int=1000,
              tol::Float64=1e-5)
              where T <: Number

    m, n = size(X)
    P = rand(n, k + p)
    Y = X * P
    sub_iterations!(X, Y, q)
    Q = qr(Y).Q
    B = Q' * X

    W = rand(m, k)
    Wr = rand(k + p, k)
    H = rand(k, n)
    res = 1

    for i = 1:max_iter
        HALS!()
        if hasConverged()
            break
    end

    return W, H
end

function HALS!(W, Wr, H, B, k::Int)
    R = B' * Wr
    S = W'W

    updateH!(H, R, S, k)

    T = B * H'
    V = H * H'

    updateWr!(Wr, Q, T, V, Q, k)
end

function updateH!(H, R, S, k)
    for j = 1:k
        H[j, :] += R[:, j] - H'S[:, j] ./ S[j, j]
        H[j, H[j, :] < 0] = 0
    end
end

function updateWr!(Wr, Q, T, V, Q, k)
    for j = 1:k
        Wr[]
    end
end

function hasConverged()
end
