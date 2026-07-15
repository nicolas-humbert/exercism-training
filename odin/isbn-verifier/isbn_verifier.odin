package isbn_verifier

import "core:strings"
import "core:unicode"

is_valid :: proc(isbn: string) -> bool {
	sanitized, alloc := strings.replace_all(isbn, "-", "")
	defer if alloc do delete(sanitized)

	if len(sanitized) != 10 do return false

	acc: int
	for char, index in sanitized {
		if index == 9 && char == 'X' {
			acc += 10
			break
		} else {
			digit := unicode.is_digit(char)

			if !digit do return false

			digit_from_rune := int(char - '0')
			acc += (10 - index) * digit_from_rune
		}
	}

	return acc % 11 == 0
}
