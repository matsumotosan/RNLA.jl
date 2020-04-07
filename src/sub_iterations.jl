# Subspace iterations

function sub_iterations(X::Array{T,2},
                        Y::Array{T,2},
                        q::Int) where {T<:Number}

    for i = 1:q
          Y = X * qr(X' * qr(Y).Q).Q
    end

    return Y
end

function sub_iterations!(X,
                         Y,
                         q::Int) where {T<:Number}

    for i = 1:q
          Y = X * qr(X' * qr(Y).Q).Q
    end
end
