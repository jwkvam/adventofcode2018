function foo()
    lines = readlines(open("data/12.txt", "r"))
    #= lines = readlines(open("h12", "r")) =#
    idx = findfirst(isequal(':'), lines[1]) + 2
    x = lines[1][idx:end]
    offset = 100
    pots = zeros(Int, length(x) + 2 * offset)
    for (i, c) in enumerate(x)
        if c == '#'
            pots[i + offset] = 1
        end
    end
    maps = Dict{Array{Int, 1}, Int}()
    for line in lines[3:end]
        println(line)
        z = zeros(5)
        label = 0
        for (i, c) in enumerate(line[1:5])
            if c == '#'
                z[i] = 1
            end
        end
        if line[end] == '#'
            label = 1
        end
        maps[z] = label
    end

    for q in 1:20
        new_pots = copy(pots)
        for i in 3:length(pots)-2
            key = pots[i-2:i+2]
            if key in keys(maps)
                new_pots[i] = maps[key]
            else
                new_pots[i] = 0
            end
        end
        pots = new_pots
    end

    summed = 0
    for (i, v) in enumerate(pots)
        if v == 1
            summed += i - offset - 1
        end
    end
    return summed
end

println(foo())
