# Randomized robust PCA

function rrpca(X::Array{T,2},
               lamda::Int,
               max_iter::Int=50,
               tol::Float64=1e-5,
               p::Int=10,
               q::Int=2,
               trace::Bool=false,
               random::Bool=true)
               where T <: Number

    m, n = size(X)
end
