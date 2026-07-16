package resistor_color

Color :: enum {
	Black,
	Brown,
	Red,
	Orange,
	Yellow,
	Green,
	Blue,
	Violet,
	Grey,
	White,
}

code :: proc(color: Color) -> int {
	return int(color)
}

colors :: proc() -> [10]Color {
	results: [10]Color = {}

	for c, i in Color {
		results[i] = c
	}

	return results
}
