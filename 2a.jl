function foo()
    file = open("data/2.txt", "r")
    threes = 0
    twos = 0
    for line in readlines(file)
        x = Dict{Char, Int}()
        for char in line
            if !(char in keys(x))
                x[char] = 0
            end
            x[char] += 1
        end
        threes += 3 in values(x)
        twos += 2 in values(x)
    end
    return twos * threes
end

println(foo())
