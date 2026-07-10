package bottle_song

import "core:fmt"
import "core:strings"

recite :: proc(start_bottles, take_down: int) -> []string {
	verses := make([dynamic]string, context.allocator)

	for i := start_bottles; i > (start_bottles - take_down); i -= 1 {
		verse(i, &verses)

		if i != start_bottles - take_down + 1 {
			append(&verses, "")
		}
	}

	return verses[:]
}

verse :: proc(num: int, verses: ^[dynamic]string) {
	upper_bottles := num_to_alpha[num]
	bottle_start := num != 1 ? "bottles" : "bottle"

	bottles_less_one := strings.to_lower(num_to_alpha[num - 1])
	bottle_end := num - 1 != 1 ? "bottles" : "bottle"

	append(
		verses,
		fmt.aprintf("%s green %s hanging on the wall,", upper_bottles, bottle_start),
		fmt.aprintf("%s green %s hanging on the wall,", upper_bottles, bottle_start),
		"And if one green bottle should accidentally fall,",
		fmt.aprintf("There'll be %s green %s hanging on the wall.", bottles_less_one, bottle_end),
	)
}

num_to_alpha := []string {
	"no",
	"One",
	"Two",
	"Three",
	"Four",
	"Five",
	"Six",
	"Seven",
	"Eight",
	"Nine",
	"Ten",
}
