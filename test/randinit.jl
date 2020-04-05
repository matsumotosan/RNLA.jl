function randinit(m::Int,n::Int,type::String)
    if type == "Gaussian"
        return randn(Float64, (m,n))
    elseif type == "Uniform"
        return rand(Float64, (m, n))
    elseif type == "Rademacher"
        return -1
    end
end
