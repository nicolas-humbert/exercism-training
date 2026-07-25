package atbash_cipher

import "core:strings"
import "core:unicode"

encode :: proc(sentence: string) -> string {
	sb := strings.builder_make()

	sentence_lower := strings.to_lower(sentence, context.temp_allocator)

	for r in sentence_lower {
		if unicode.is_space(r) || unicode.is_punct(r) do continue
		if strings.builder_len(sb) % 6 == 5 do strings.write_rune(&sb, ' ')
		if unicode.is_digit(r) do strings.write_rune(&sb, r)
		if unicode.is_alpha(r) do strings.write_rune(&sb, 'z' - r + 'a')
	}

	return strings.to_string(sb)
}

decode :: proc(sentence: string) -> string {
	sb := strings.builder_make()

	for r in sentence {
		if unicode.is_space(r) do continue
		if unicode.is_digit(r) do strings.write_rune(&sb, r)
		if unicode.is_alpha(r) do strings.write_rune(&sb, 'z' - r + 'a')
	}

	return strings.to_string(sb)

}
