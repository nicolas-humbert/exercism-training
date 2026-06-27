package bob

import "core:strings"
import "core:unicode"

response :: proc(input: string) -> string {
	trimmed := strings.trim_space(input)
	if len(trimmed) == 0 do return "Fine. Be that way!"

	ends_with_question_mark: bool = trimmed[len(trimmed) - 1] == '?'

	full_capital_letters: bool = false
	is_full_spaces: bool = true

	for l in trimmed {
		if is_full_spaces && !unicode.is_space(l) {
			is_full_spaces = false
		}

		if !full_capital_letters && unicode.is_upper(l) {
			full_capital_letters = true
			continue
		}

		if full_capital_letters && unicode.is_lower(l) {
			full_capital_letters = false
			break
		}
	}

	if is_full_spaces do return "Fine. Be that way!"
	if ends_with_question_mark && full_capital_letters do return "Calm down, I know what I'm doing!"
	if ends_with_question_mark && !full_capital_letters do return "Sure."
	if !ends_with_question_mark && full_capital_letters do return "Whoa, chill out!"
	return "Whatever."
}
