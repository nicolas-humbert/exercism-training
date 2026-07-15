package line_up

import "core:fmt"
format :: proc(name: string, number: int) -> string {

	suffix: string = "th"
	rest_by_10 := number % 10
	rest_by_100 := number % 100
	if rest_by_10 == 1 && rest_by_100 != 11 do suffix = "st"
	if rest_by_10 == 2 && rest_by_100 != 12 do suffix = "nd"
	if rest_by_10 == 3 && rest_by_100 != 13 do suffix = "rd"

	formatted := fmt.aprintf(
		"%s, you are the %d%s customer we serve today. Thank you!",
		name,
		number,
		suffix,
	)

	return formatted
}
