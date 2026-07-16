package rna_transcription

import "core:fmt"
import "core:strings"

to_rna :: proc(dna: string) -> (rna: string, ok: bool) {
	sb := strings.builder_make()

	for r, i in dna {
		switch r {
		case 'G':
			fmt.sbprint(&sb, "C")
		case 'C':
			fmt.sbprint(&sb, "G")
		case 'T':
			fmt.sbprint(&sb, "A")
		case 'A':
			fmt.sbprint(&sb, "U")
		case:
			return "", false
		}
	}

	return strings.to_string(sb), true
}
