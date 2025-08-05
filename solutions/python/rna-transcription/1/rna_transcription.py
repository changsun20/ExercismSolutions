def to_rna(dna_strand):
    transform = {
        'G':'C', 
        'C':'G',
        'A':'U',
        'T':'A'
    }
    rna = ''
    for i in dna_strand:
        rna += transform[i]
    return rna