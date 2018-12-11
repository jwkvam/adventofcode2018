function get_image(data, xmax, ymax, xmin, ymin)
    imm = zeros(Int64, xmax - xmin + 1, ymax - ymin + 1)
    for i in 1:length(data[:, 1])
        point = data[i, :]
        x = point[1] - xmin + 1
        y = point[2] - ymin + 1
        @assert 0 < x <= xmax - xmin + 1
        @assert 0 < y <= ymax - ymin + 1
        imm[x, y] = 1
    end
    return imm
end

function prettyprint(imm)
    for i in 1:length(imm[1, :])
        dt = -11 .* imm[:, i] .+ 46
        println(join(convert.(Char, dt)))
    end
end

function foo()
    lines = readlines(open("data/10.txt", "r"))

    points = zeros(Int, length(lines), 2)
    velocity = zeros(Int, length(lines), 2)
    for (i, line) in enumerate(lines)
        start = findfirst(isequal('<'), line) + 1
        middle = findfirst(isequal(','), line)
        stop = findfirst(isequal('>'), line) - 1
        x = parse(Int, line[start:middle-1])
        y = parse(Int, line[middle+1:stop])
        points[i, :] = [x, y]

        start = findnext(isequal('<'), line, stop+2) + 1
        middle = findnext(isequal(','), line, stop+2)
        stop = findnext(isequal('>'), line, stop+2) - 1
        x = parse(Int, line[start:middle-1])
        y = parse(Int, line[middle+1:stop])
        velocity[i, :] = [x, y]
    end

    xdist = 100000
    ydist = 100000
    xtime = 0
    ytime = 0
    for time in 10000:12000
        data = points + (time .* velocity)

        ys = maximum(data[:, 2]) - minimum(data[:, 2])
        xs = maximum(data[:, 1]) - minimum(data[:, 1])
        if xs < xdist
            xdist = xs
            xtime = time
        end
        #= colsum = sum(imm, dims=1) =#
        if ys < ydist
            ydist = ys
            ytime = time
        end
    end
    
    @assert ytime == xtime
    data = points + (xtime .* velocity)
    xmax = maximum(data[:, 1])
    xmin = minimum(data[:, 1])
    ymax = maximum(data[:, 2])
    ymin = minimum(data[:, 2])

    imm = get_image(data, xmax, ymax, xmin, ymin)

    prettyprint(imm)
end

foo()
