package resistor_color_duo

import "core:fmt"
import "core:strconv"
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

Error :: enum {
	None,
	TooFewColors,
	Unimplemented,
}

value :: proc(colors: []Color) -> (int, Error) {
	if len(colors) < 2 do return 0, .TooFewColors

	buf: [2]byte
	res_as_str := fmt.bprintf(buf[:], "%d%d", int(colors[0]), int(colors[1]))
	val, _ := strconv.parse_int(res_as_str, 10)

	return val, .None
}
