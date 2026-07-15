package grains

import "core:math"
Error :: enum {
	None = 0,
	InvalidSquare,
	Unimplemented,
}

// Returns the number of grains on the specified square.
square :: proc(n: int) -> (u64, Error) {
	if n <= 0 || n > 64 do return 0, .InvalidSquare

	return u64(math.pow2_f64(n - 1)), .None
}

// Returns the total number of squares on the board.
total :: proc() -> (u64, Error) {
	acc: u64 = 0
	for i in 1 ..= 64 {
		sq, _ := square(i)
		acc += sq
	}

	return acc, .None
}
