my_f(x,y) = 2x+3y

function rsvd(X,
              r::Int,
              q::Int=1,
              p::Int=5)

      m, n = size(X)
      P = rand(n,r+p)
      Z = X * P

      for i = 1:q
      Z = X * (X' * Z)
      end

      F = qr(Z)
      Y = F.Q * X
      U, S, V = svd(Y)

      return m
end
