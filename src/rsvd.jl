function rsvd(X, r::Int, q::Int=1, p::Int=5, scheme::String="subspace")

      m, n = size(X)
      P = randinit(n, r+p)
      Z = X * P

      if scheme == :direct
            for i = 1:q
                  Z = X * (X' * Z)
            end
      elseif scheme == :subspace
            for i = 1:q
                  Z = qr(X' * qr(Z).Q)
            end
      elseif scheme == :normalized
            for i = 1:q
                  Z = lu(A' * lu(Z).L)
            end
      end

      Q = qr(Z).Q
      Y = Q' * X
      U, S, V = svd(Y)

      return Q * U, S, V
end
