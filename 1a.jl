function foo()
    file = open("data/1.txt", "r")
    return sum(parse.(Int64, readlines(file)))
end

println(foo())
