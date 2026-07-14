package darts

import "core:math"

OUTER_CIRCLE_RADIUS :: 10.0
MIDDLE_CIRCLE_RADIUS :: 5.0
INNER_CIRCLE_RADIUS :: 1.0

score :: proc(x, y: f64) -> int {
	throw_distance_from_center := distance_from_center(x, y)

	if throw_distance_from_center > OUTER_CIRCLE_RADIUS do return 0
	if throw_distance_from_center > MIDDLE_CIRCLE_RADIUS do return 1
	if throw_distance_from_center > INNER_CIRCLE_RADIUS do return 5
	return 10
}

distance_from_center :: proc(x, y: f64) -> f64 {
	return math.sqrt_f64(x * x + y * y)
}
