function foo()
    lines = readlines(open("data/2.txt", "r"))
    for i in 1:26
        x = Set{String}()
        for line in lines
            if i == 1
                str = line[2:end]
            elseif i == 26
                str = line[1:end-1]
            else
                str = line[1:i-1] * line[i+1:end]
            end
            if str in x
                return str
            end
            push!(x, str)
        end
    end
end

println(foo())
