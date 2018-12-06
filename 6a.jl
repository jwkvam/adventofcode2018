function foo()
    lines = readlines(open("data/6.txt", "r"))
    points = zeros(Int, length(lines), 2)
    maxx = 0
    for (i, line) in enumerate(lines)
        point = parse.(Int, split(line, ','))
        if any(point .> maxx)
            maxx = maximum(point)
        end
        points[i, :] = point
    end
    areas = Dict{Int, Int}()

    bad_idx = Set{Int}()
    stop = maxx
    start = 0
    for i in start:stop
        for j in start:stop
            dist = abs.(points[:, 1] .- i) .+ abs.(points[:, 2] .- j)
            min_dist = minimum(dist)
            if sum(dist .== min_dist) == 1
                idx = argmin(dist)
                if !(idx in keys(areas))
                    areas[idx] = 0
                end
                areas[idx] += 1
                if i == start || i == stop || j == start || j == stop
                    push!(bad_idx, idx)
                end
            end
        end
    end
    for idx in bad_idx
        delete!(areas, idx)
    end
    return maximum(values(areas))
end

println(foo())
