package difference_of_squares

square_of_sum_v1 :: proc(n: int) -> int {
	acc: int
	for i in 0 ..< n + 1 do acc += i
	return acc * acc
}

sum_of_squares_v1 :: proc(n: int) -> int {
	acc: int
	for i in 0 ..< n + 1 do acc += i * i
	return acc
}

square_of_sum :: proc(n: int) -> int {
	sum := (n * (n + 1)) / 2
	return sum * sum
}

sum_of_squares :: proc(n: int) -> int {
	return (n * (n + 1) * (2 * n + 1)) / 6

}

difference :: proc(n: int) -> int {
	return square_of_sum(n) - sum_of_squares(n)
}
