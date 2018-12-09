function foo()
    lines = readlines(open("data/7.txt", "r"))
    basework = 60
    workers = 5
    deps = Dict{Char, Array{Char, 1}}()
    total = Set{Char}()
    for line in lines
        a = line[6]
        b = line[37]
        if !(a in keys(deps))
            deps[a] = []
        end
        push!(total, a)
        push!(total, b)
        push!(deps[a], b)
    end
    working = Dict{Char, Int}()
    total_time = 0
    while !(isempty(total) && isempty(working))
        j = Set(vcat(values(deps)...))
        avail = sort(collect(setdiff(total, j)))
        for c in avail[1:min(end, workers-length(working))]
            working[c] = c - 'A' + 1 + basework
            delete!(total, c)
        end
        worktime = minimum(values(working))
        @assert worktime > 0
        total_time += worktime
        for (char, time) in working
            time -= worktime
            @assert time >= 0
            if time == 0
                delete!(deps, char)
                delete!(working, char)
            else
                working[char] = time
            end
        end
    end
    return total_time
end

println(foo())
