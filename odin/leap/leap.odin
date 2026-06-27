package leap

is_leap_year :: proc(year: int) -> bool {
	by_4 := year % 4 == 0
	by_100 := year % 100 == 0
	by_400 := year % 400 == 0
	return by_4 && (!by_100 || by_100 && by_400)
}
