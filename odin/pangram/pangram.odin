package pangram

import "core:unicode"
is_pangram :: proc(str: string) -> bool {
	checkmap := make(map[rune]bool)
	defer delete_map(checkmap)

	checkmap['a'] = false
	checkmap['b'] = false
	checkmap['c'] = false
	checkmap['d'] = false
	checkmap['e'] = false
	checkmap['f'] = false
	checkmap['g'] = false
	checkmap['h'] = false
	checkmap['i'] = false
	checkmap['j'] = false
	checkmap['k'] = false
	checkmap['l'] = false
	checkmap['m'] = false
	checkmap['n'] = false
	checkmap['o'] = false
	checkmap['p'] = false
	checkmap['q'] = false
	checkmap['r'] = false
	checkmap['s'] = false
	checkmap['t'] = false
	checkmap['u'] = false
	checkmap['v'] = false
	checkmap['w'] = false
	checkmap['x'] = false
	checkmap['y'] = false
	checkmap['z'] = false

	for rune in str {
		if !unicode.is_alpha(rune) do continue

		checkmap[unicode.to_lower(rune)] = true
	}

	for _, exists in checkmap {
		if !exists do return false
	}

	return true
}
