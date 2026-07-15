package luhn

import "core:fmt"
import "core:strings"
import "core:unicode"

valid :: proc(value: string) -> bool {
	sanitized, alloc := strings.replace_all(value, " ", "")
	defer if alloc do delete(sanitized)

	if len(sanitized) <= 1 do return false

	// First step
	acc := 0
	#reverse for rune, index in sanitized {
		if !unicode.is_digit(rune) do return false

		digit := int(rune - '0')

		if (len(sanitized) - 1 - index) % 2 != 0 {
			digit *= 2
			if digit > 9 do digit -= 9
		}

		acc += digit
	}

	return acc % 10 == 0
}
