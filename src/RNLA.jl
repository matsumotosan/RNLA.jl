module RNLA

using LinearAlgebra

greet() = print("Hello World!")

include("rsvd.jl")

export my_f, rsvd

end # module
