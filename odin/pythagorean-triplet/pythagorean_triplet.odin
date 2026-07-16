package pythagorean_triplet

import "core:fmt"
import "core:math"

Triplet :: struct {
	a, b, c: int,
}

triplets_with_sum :: proc(n: int) -> []Triplet {

	triplets := make([dynamic]Triplet)

	for a := 1; 3 * a <= n; a += 1 {
		a_square := a * a
		for b := a + 1; b <= (n - a) / 2; b += 1 {
			b_square := b * b

			c := n - a - b

			// fmt.printfln("%d, %d, %d, %d, %d, %d", a, b, c, n, a_square + b_square, c * c)

			if a_square + b_square == c * c {
				append_elem(&triplets, Triplet{a, b, c})
			}
		}
	}


	return triplets[:]
}
