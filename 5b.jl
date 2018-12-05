function trim(polymer)
    chars = Array{Char, 1}()
    for char in polymer
        if char == '\n'
            continue
        elseif !(isempty(chars)) && lowercase(char) == lowercase(chars[end]) && chars[end] != char
            pop!(chars)
        else
            push!(chars, char)
        end
    end
    return join(chars)
end

function purge(polymer, char)
    return join(x for x in polymer if lowercase(x) != char)
end

function foo()
    polymer = trim(convert.(Char, read(open("data/5.txt", "r"))))
    min_length = 999999
    for char in 'a':'z'
        len = length(trim(purge(polymer, char)))
        if min_length > len
            min_length = len
        end
    end
    return min_length
end

println(foo())
