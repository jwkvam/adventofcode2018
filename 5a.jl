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

function foo()
    polymer = convert.(Char, read(open("data/5.txt", "r")))
    return length(trim(polymer))
end

println(foo())
