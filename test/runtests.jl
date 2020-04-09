using SafeTestsets

@safetestset "rsvd" begin include("rsvd_tests.jl") end
@safetestset "rpca" begin include("rpca_tests.jl") end
@safetestset "rrpca" begin include("rrpca_tests.jl") end
@safetestset "rcur" begin include("rcur_tests.jl") end
# @safetestset "rnmf" begin include("rnmf_tests.jl") end
# @safetestset "rica" begin include("rica_tests.jl") end
# @safetestset "rid" begin include("rid_tests.jl") end
@safetestset "rdmd" begin include("rdmd_tests.jl") end
# @safetestset "rnca" begin include("rnca_tests.jl") end
