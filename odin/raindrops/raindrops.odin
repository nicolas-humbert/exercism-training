package raindrops

import "core:fmt"
import "core:strings"

convert :: proc(number: int) -> string {
	sb := strings.builder_make()

	if number % 3 == 0 do fmt.sbprint(&sb, "Pling")
	if number % 5 == 0 do fmt.sbprint(&sb, "Plang")
	if number % 7 == 0 do fmt.sbprint(&sb, "Plong")

	if len(sb.buf) == 0 {
		fmt.sbprintf(&sb, "%d", number)
	}

	return strings.to_string(sb)
}
