function minute(line::String)
    return parse(Int, line[16:17])
end

function foo()
    lines = sort(readlines(open("data/4.txt", "r")))
    x = Dict{Int, Array{Int, 1}}()
    guard = -1
    for line in lines
        if occursin("Guard", line)
            start = findfirst(isequal('#'), line)
            stop = findnext(isequal(' '), line, start)
            guard = parse(Int, line[start+1:stop-1])
            if !(guard in keys(x))
                x[guard] = zeros(Int, 60)
            end
        elseif occursin("falls", line)
            start = minute(line) + 1
            x[guard][start:end] .+= 1
        elseif occursin("wakes", line)
            start = minute(line) + 1
            x[guard][start:end] .-= 1
        end
    end

    sleepiest = -1
    time_asleep = -1
    for (guard, sleep) in x
        sum_sleep = sum(sleep)
        if sum_sleep > time_asleep
            sleepiest = guard
            time_asleep = sum_sleep
        end
    end

    max_minute = argmax(x[sleepiest]) - 1
    return sleepiest * max_minute
end

println(foo())
