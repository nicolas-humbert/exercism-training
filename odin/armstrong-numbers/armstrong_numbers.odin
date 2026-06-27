package armstrong_numbers

is_armstrong_number :: proc(n: u128) -> bool {
	if n == 0 do return true

	digits := make([dynamic]u128)
	defer delete(digits)

	temp := n
	for temp > 0 {
		digit := temp % 10
		append(&digits, digit)
		temp /= 10
	}

	acc: u128 = 0
	length: int = len(digits)
	for d in digits {
		acc += pow_u128(u128(d), u128(len(digits)))
	}

	return acc == n
}

pow_u128 :: proc(base, exponent: u128) -> u128 {
	res: u128 = 1
	b := base
	exp := exponent

	for exp > 0 {
		if exp & 1 == 1 {
			res *= b
		}
		b *= b
		exp >>= 1
	}
	return res
}
