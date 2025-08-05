"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    input = strip(input)
    input = lowercase(input)
    d = Dict()
    for i in input
        if haskey(d,i) == false
            d[i] = 1
        else
            d[i] += 1
        end
    end
    for i in "abcdefghijklmnopqrstuvwxyz"
        if haskey(d,i) == false
            return false
        end
    end
    true
end

