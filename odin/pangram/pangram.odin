package pangram

import "core:slice"
import "core:unicode"

is_pangram :: proc(str: string) -> bool {
	found: [26]bool

	for rune in str {
		lowered := unicode.to_lower(rune)
		if lowered >= 'a' && lowered <= 'z' {
			found[lowered - 'a'] = true
		}
	}

	return slice.all_of(found[:], true)
}
