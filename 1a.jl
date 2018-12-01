function foo()
    file = open("data/1.txt", "r")
    print(sum(parse.(Int64, readlines(file))))
end

foo()
