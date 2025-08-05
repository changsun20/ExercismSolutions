"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    d=Dict('A' => 0, 'T' => 0, 'C' => 0, 'G' => 0)
    for i in strand
        if i == 'A'
            d['A'] += 1
        elseif i == 'C'
            d['C'] += 1
        elseif i == 'T'
            d['T'] += 1
        elseif i == 'G'
            d['G'] += 1
        else
            sqrt(-1)
            break
        end
    end
    d
end