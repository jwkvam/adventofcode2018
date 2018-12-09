function foo()
    lines = readlines(open("data/7.txt", "r"))
    #= lines = readlines(open("h7", "r")) =#
    deps = Dict{Char, Array{Char, 1}}()
    for line in lines
        a = line[6]
        b = line[37]
        if !(a in keys(deps))
            deps[a] = []
        end
        push!(deps[a], b)
    end

    order = Array{Char, 1}()
    total = Set(vcat(values(deps)...))
    while !isempty(deps)

        s = Set(keys(deps))
        j = Set(vcat(values(deps)...))
        x = sort(collect(setdiff(s, j)))

        push!(order, x[1])
        delete!(deps, x[1])
        delete!(total, x[1])
    end
    x = vcat(order, sort(collect(total)))
    return join(x)
end

println(foo())
