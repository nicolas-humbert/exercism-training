package difference_of_squares

square_of_sum :: proc(n: int) -> int {
	acc: int

	for i in 0 ..< n + 1 {
		acc += i
	}

	return acc * acc
}

sum_of_squares :: proc(n: int) -> int {
	acc: int

	for i in 0 ..< n + 1 {
		acc += i * i
	}

	return acc
}

difference :: proc(n: int) -> int {
	return square_of_sum(n) - sum_of_squares(n)
}
