package isogram

import "core:unicode"
is_isogram :: proc(word: string) -> bool {
	memo := make(map[rune]struct{})
	defer delete(memo)

	for r in word {
		if r == ' ' || r == '-' do continue

		lower := unicode.to_lower(r)

		if lower in memo do return false

		memo[lower] = {}
	}

	return true
}
