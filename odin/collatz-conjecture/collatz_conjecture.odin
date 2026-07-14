package collatz_conjecture

// Returns the number of steps to get to a value of 1.
steps :: proc(start: int) -> (result: int, ok: bool) {
	// Implement this procedure.
	current_value := start

	if start <= 0 do return

	for {
		if current_value == 1 {
			ok = true
			break
		}

		if current_value % 2 == 0 do current_value /= 2
		else do current_value = (current_value * 3) + 1

		result += 1
	}

	return result, ok
}
