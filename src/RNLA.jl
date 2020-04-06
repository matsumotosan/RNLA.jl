module RNLA
    using LinearAlgebra

    export rsvd, rpca, rrpca, rid, rcur

    include("rsvd.jl")
    include("randinit.jl")
    include("rqb.jl")
    # include("rpca.jl")
    # include("rrpca.jl")
    # include("rid.jl")
    # include("rcur.jl")

end # module
