package acronym

import "core:strings"

abbreviate :: proc(phrase: string) -> string {

	sb: strings.Builder
	strings.builder_init(&sb)
	defer strings.builder_destroy(&sb)

	for rune, i in phrase {
		if i == 0 {
			strings.write_byte(&sb, u8(rune))
			continue
		}

		if !(rune >= 'a' && rune <= 'z' || rune >= 'A' && rune <= 'Z') do continue

		last_char := phrase[i - 1]
		if (last_char == ' ' || last_char == '-' || last_char == '_') {
			strings.write_byte(&sb, u8(rune))
		}
	}

	return strings.to_upper(strings.to_string(sb))
}
