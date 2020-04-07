# Subspace iterations

function sub_iterations(X,
                        Y,
                        q::Int)

    for i = 1:q
          Y = X * qr(X' * qr(Y).Q).Q
    end

    return Y
end

function sub_iterations!(X,
                         Y,
                         q::Int)

    for i = 1:q
          Y = X * qr(X' * qr(Y).Q).Q
    end
end
