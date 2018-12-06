function foo()
    lines = readlines(open("data/6.txt", "r"))
    total_distance = 10000
    points = zeros(Int, length(lines), 2)
    maxx = 0
    for (i, line) in enumerate(lines)
        point = parse.(Int, split(line, ','))
        if any(point .> maxx)
            maxx = maximum(point)
        end
        points[i, :] = point
    end

    stop = maxx + 10
    start = -10
    area = 0
    for i in start:stop
        for j in start:stop
            dist = abs.(points[:, 1] .- i) .+ abs.(points[:, 2] .- j)
            area += sum(dist) < total_distance
        end
    end
    return area
end

println(foo())
