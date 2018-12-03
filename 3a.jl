function foo()
    lines = readlines(open("data/3.txt", "r"))
    claims = zeros(Int, 1000, 1000)
    for line in lines
        a, b, c, d = split(line, ' ')
        x, y = parse.(Int, split(c[1:end-1], ',')) .+ 1
        w, h = parse.(Int, split(d, 'x')) .- 1
        claims[x:x+w, y:y+h] .+= 1
    end
    return sum(claims .> 1)
end

println(foo())
