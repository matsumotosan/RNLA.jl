# Randomized SVD

function rsvd(X, k::Int, p::Int=1, q::Int=5)
      Q, B = rqb(X, k, p, q)
      U, S, Vt = svd(B)
      
      return Q * U, S[1:k], Vt[:, 1:k]
end
