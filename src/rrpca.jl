# Randomized robust PCA

function rrpca(X,                   # (m,n) matrix
               k::Int=2,            # initial target rank
               λ::Int,              # sparse error term weight
               max_iter::Int=50,    # maximum number of iterations
               tol::Float64=1e-5,   # convergence tolerance
               p::Int=10,           # oversampling parameter
               q::Int=2)            # power scheme parameter

    m, n = size(X)
    μ = 1.25 * norm(X, 2)
    Z = X ./ dualnorm(X)
    S = spzeros(m, n)

    iter = 0
    while !converged() && iter < max_iter
        U, Σ, V = rsvd(X - S + Z ./ μ, k, p, q)
        k, l = predict_rank(Σ, 1 / μ)
        Σ_l = soft_thres(Diagonal(Σ)[1:l], 1 / μ)
        L = U[:, 1:l] * Σ_l * V[:, 1:l]'
        S = soft_thres(X - L + Z ./ μ, λ / μ)
        Z += (X - L - S) .* μ
        iter += 1
    end

    return L, S, X - L - S
end

function predict_rank()
end

function soft_thres()
end

converged(X, L, S, tol) = norm(X - L - S) < tol

function update_mu!()

end
