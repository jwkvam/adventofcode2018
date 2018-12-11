function powerlevel(x, y)
    serial = 7511
    rackid = x + 10
    power = rackid * y
    power += serial
    power *= rackid
    power = convert(Int, floor(power / 100)) % 10
    return power - 5
end

function foo()
    max_power = -100000000
    max_x = 0
    max_y = 0
    max_size = 0

    data = zeros(Int, 300, 300)

    for x in 1:300
        for y in 1:300
            data[x, y] = powerlevel(x, y)
        end
    end

    for x in 1:300
        for y in 1:300
            for size in 0:(300-max(x,y))
                power = 0
                for i in 0:size
                    for j in 0:size
                        power += data[x + i, y + j]
                    end
                end
                if power > max_power
                    max_power = power
                    max_x = x
                    max_y = y
                    max_size = size + 1
                end
            end
        end
    end

    return max_x, max_y, max_size
end

z = foo()
println(z[1])
println(z[2])
println(z[3])
