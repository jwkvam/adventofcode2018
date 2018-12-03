function parserect(line::String)
    a, b, c, d = split(line, ' ')
    x, y = parse.(Int, split(c[1:end-1], ',')) .+ 1
    w, h = parse.(Int, split(d, 'x')) .- 1
    return x, y, w, h
end

function foo()
    lines = readlines(open("data/3.txt", "r"))
    claims = zeros(Int, 1000, 1000)
    for line in lines
        x, y, w, h = parserect(line)
        claims[x:x+w, y:y+h] .+= 1
    end
    for line in lines
        a, = split(line, ' ')
        x, y, w, h = parserect(line)
        if all(claims[x:x+w, y:y+h] .== 1)
            return a[2:end]
        end
    end
end

println(foo())
