module RNLA
    using LinearAlgebra

    export rsvd, rpca, rrpca, rid, rcur

    include("rsvd.jl")
    include("randinit.jl")
    include("rqb.jl")
    include("rpca.jl")
    include("sub_iterations.jl")
    # include("rrpca.jl")
    include("rid.jl")
    include("rcur.jl")
    # include("rnmf.jl")
    # include("rdmd.jl")

end # module
