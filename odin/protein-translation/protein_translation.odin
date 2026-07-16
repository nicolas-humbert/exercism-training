package protein_translation

// proteins returns the list of aminoacid associated with the rna_strand.
// The second parameter indicates if the translation was successful.
proteins :: proc(rna_strand: string) -> ([]string, bool) {
	// if len(rna_strand) % 3 != 0 do return nil, false

	protein := [dynamic]string{}

	for r := 0; r < len(rna_strand); r += 3 {
		if r + 3 > len(rna_strand) do return nil, false

		sub_strand: string = rna_strand[r:r + 3]
		aa := get_amino_acid(sub_strand)

		if aa == "STOP" do break
		if aa == "INVALID" do return nil, false
		append(&protein, aa)
	}

	return protein[:], true
}

get_amino_acid :: proc(bases: string) -> string {
	switch bases {
	case "AUG":
		return "Methionine"
	case "UUU", "UUC":
		return "Phenylalanine"
	case "UUA", "UUG":
		return "Leucine"
	case "UCU", "UCC", "UCA", "UCG":
		return "Serine"
	case "UAU", "UAC":
		return "Tyrosine"
	case "UGU", "UGC":
		return "Cysteine"
	case "UGG":
		return "Tryptophan"
	case "UAA", "UAG", "UGA":
		return "STOP"
	case:
		return "INVALID"
	}
}
