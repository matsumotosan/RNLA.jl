using RNLA
using Test
using Plots

X = rand(10000,5000)
r = 100
U,S,V = rsvd(X,r)
x = 1:r
plot(1:10,S[1:10])

@testset "rsvd" begin
    X = rand(3,3)
    @test rsvd(X,1) == 3
end
