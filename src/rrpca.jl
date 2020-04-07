# Randomized robust PCA

function rrpca(X,
               lamda::Int,
               max_iter::Int=50,
               tol::Float64=1e-5,
               p::Int=10,
               q::Int=2)

    m, n = size(X)
    k = 2
    μ = 1.25 * norm(X, 2)
    Z =
    S = zeros(m, n)

    while !converged()
    end

    return L, S
end

function converged()
    
end
