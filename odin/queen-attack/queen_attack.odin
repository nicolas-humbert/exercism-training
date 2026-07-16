package queen_attack

Error :: enum {
	None,
	InvalidPosition,
	SameSquare,
	Unimplemented,
}

Queen :: [2]int

create :: proc(x, y: int) -> (Queen, Error) {
	if x < 0 || y < 0 || x > 7 || y > 7 do return {}, .InvalidPosition

	return Queen{x, y}, .None
}

can_attack :: proc(white, black: Queen) -> (bool, Error) {
	if white[0] == black[0] && white[1] == black[1] do return false, .SameSquare

	return black[0] == white[0] ||
		black[1] == white[1] ||
		black[0] - black[1] == white[0] - white[1] ||
		black[0] + black[1] == white[0] + white[1],
		.None
}
