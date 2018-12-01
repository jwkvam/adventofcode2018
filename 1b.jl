function foo()
    file = open("data/1.txt", "r")
    freq = 0
    x = Set{Int64}(freq)
    adjs = parse.(Int64, readlines(file))
    while true
        for a in adjs
            freq += a
            if freq in x
                println(freq)
                return
            else
                push!(x, freq)
            end
        end
    end
end

foo()
