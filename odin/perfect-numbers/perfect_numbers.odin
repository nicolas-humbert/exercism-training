package perfect_numbers

Classification :: enum {
	Perfect,
	Abundant,
	Deficient,
	Undefined,
}

classify :: proc(number: uint) -> Classification {
	if number == 0 do return .Undefined
	if number == 1 do return .Deficient

	al_sum: uint = 1
	max_factor := number / 2

	for i: uint = 2; i <= max_factor; i += 1 {
		if number % i == 0 do al_sum += i
	}

	switch {
	case number == al_sum:
		return .Perfect
	case number < al_sum:
		return .Abundant
	case number > al_sum:
		return .Deficient
	case:
		return .Undefined
	}
}
