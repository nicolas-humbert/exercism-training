package series

Error :: enum {
	None,
	Invalid_Series_Length_Too_Large,
	Invalid_Series_Length_Zero,
	Invalid_Series_Length_Negative,
	Invalid_Sequence_Empty,
	Unimplemented,
}

series :: proc(sequence: string, series_len: int) -> ([]string, Error) {
	if len(sequence) == 0 do return {}, .Invalid_Sequence_Empty
	if series_len > len(sequence) do return {}, .Invalid_Series_Length_Too_Large
	if series_len == 0 do return {}, .Invalid_Series_Length_Zero
	if series_len < 0 do return {}, .Invalid_Series_Length_Negative

	results := make([dynamic]string)

	for i := 0; i <= len(sequence) - series_len; i += 1 {
		append(&results, sequence[i:i + series_len])
	}

	return results[:], .None
}
