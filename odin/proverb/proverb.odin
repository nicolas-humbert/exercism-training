package proverb

import "core:fmt"
recite :: proc(items: []string) -> []string {
	verses := make([dynamic]string)

	if len(items) == 0 do return verses[:]

	for i := 0; i < len(items) - 1; i += 1 {
		append(&verses, fmt.aprintf("For want of a %s the %s was lost.", items[i], items[i + 1]))
	}

	append(&verses, fmt.aprintf("And all for the want of a %s.", items[0]))

	return verses[:]
}
