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
    max_minute = -1
    sleep_time = -1
    for (guard, sleep) in x
        max_sleep = maximum(sleep)
        if max_sleep > sleep_time
            sleepiest = guard
            max_minute = argmax(sleep) - 1
            sleep_time = max_sleep
        end
    end

    return sleepiest * max_minute
end

println(foo())
