package hamming

Error :: enum {
	None,
	UnequalLengths,
	Unimplemented,
}

distance :: proc(strand1, strand2: string) -> (int, Error) {
	if len(strand1) != len(strand2) do return 0, .UnequalLengths

	dt: int

	for i := 0; i < len(strand1); i += 1 {
		base1 := strand1[i]
		base2 := strand2[i]

		if base1 != base2 do dt += 1
	}

	return dt, .None
}
