package darts

import "math"

var (
	OUTER_CIRCLE_RADIUS  = 10.0
	MIDDLE_CIRCLE_RADIUS = 5.0
	INNER_CIRCLE_RADIUS  = 1.0
)

func Score(x, y float64) int {
	throwDistanceFromCenter := DistanceFromCenter(x, y)

	if throwDistanceFromCenter > OUTER_CIRCLE_RADIUS {
		return 0
	}
	if throwDistanceFromCenter > MIDDLE_CIRCLE_RADIUS {
		return 1
	}
	if throwDistanceFromCenter > INNER_CIRCLE_RADIUS {
		return 5
	}

	return 10
}

func DistanceFromCenter(x, y float64) float64 {
	return math.Sqrt(x*x + y*y)
}
