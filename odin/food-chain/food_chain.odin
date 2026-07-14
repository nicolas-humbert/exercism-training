package food_chain

import "core:fmt"
import "core:strings"

animals := [9]string{"", "fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"}
sentences := [9]string {
	"",
	"",
	"It wriggled and jiggled and tickled inside her.",
	"How absurd to swallow a bird!",
	"Imagine that, to swallow a cat!",
	"What a hog, to swallow a dog!",
	"Just opened her throat and swallowed a goat!",
	"I don't know how she swallowed a cow!",
	"She's dead, of course!",
}

recite :: proc(start, end: int) -> string {
	sb := strings.builder_make()
	defer strings.builder_destroy(&sb)

	for i in start ..= end {

		if i == 8 {
			fmt.sbprintln(&sb, "I know an old lady who swallowed a horse.")
			fmt.sbprint(&sb, "She's dead, of course!")
			continue
		}

		fmt.sbprintfln(&sb, "I know an old lady who swallowed a %s.", animals[i])
		if len(sentences[i]) > 0 do fmt.sbprintfln(&sb, "%s", sentences[i])

		for j := i; j > 1; j -= 1 {
			if j == 3 {
				fmt.sbprintfln(
					&sb,
					"She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
				)
			} else {
				fmt.sbprintfln(
					&sb,
					"She swallowed the %s to catch the %s.",
					animals[j],
					animals[j - 1],
				)
			}
		}

		if i != end {
			fmt.sbprintln(&sb, "I don't know why she swallowed the fly. Perhaps she'll die.")
			fmt.sbprintln(&sb, "")
		} else {
			fmt.sbprint(&sb, "I don't know why she swallowed the fly. Perhaps she'll die.")
		}
	}

	return strings.to_string(sb)
}
