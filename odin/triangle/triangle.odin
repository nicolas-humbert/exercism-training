package triangle

Error :: enum {
	None,
	Not_A_Triangle,
	Unimplemented,
}

is_equilateral :: proc(a: f64, b: f64, c: f64) -> (bool, Error) {
	if !is_triangle(a, b, c) do return false, .Not_A_Triangle
	return a == b && a == c && b == c, .None
}

is_isosceles :: proc(a: f64, b: f64, c: f64) -> (bool, Error) {
	if !is_triangle(a, b, c) do return false, .Not_A_Triangle

	return a == b || a == c || b == c, .None
}

is_scalene :: proc(a: f64, b: f64, c: f64) -> (bool, Error) {
	if !is_triangle(a, b, c) do return false, .Not_A_Triangle
	isoceles, _ := is_isosceles(a, b, c)
	return !isoceles, .None
}

is_triangle :: proc(a, b, c: f64) -> bool {
	return a > 0 && b > 0 && c > 0 && a + b >= c && b + c >= a && a + c >= b
}
