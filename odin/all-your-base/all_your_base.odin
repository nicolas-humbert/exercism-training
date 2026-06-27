package all_your_base

Error :: enum {
	None,
	Invalid_Input_Digit,
	Input_Base_Too_Small,
	Output_Base_Too_Small,
	Unimplemented,
}

rebase :: proc(input_base: int, digits: []int, output_base: int) -> ([]int, Error) {
	// 0. Error handling
	if input_base < 2 {
		return nil, .Input_Base_Too_Small
	}
	if output_base < 2 {
		return nil, .Output_Base_Too_Small
	}

	// 1. Convert source base to intermediate base 10 (decimal)
	decimal_val: int = 0
	multiplier: int = 1
	for i := len(digits) - 1; i >= 0; i -= 1 {
		d := digits[i]
		// Validate that the digit belongs in the input base
		if d < 0 || d >= input_base {
			return nil, .Invalid_Input_Digit
		}

		decimal_val += d * multiplier
		multiplier *= input_base
	}

	// Edge case for zero
	if decimal_val == 0 {
		data := make([]int, 1)
		data[0] = 0
		return data, nil
	}

	// 2. Convert base 10 to the target base_out
	// We size the maximum possible digits based on the logarithmic upper bound
	temp_digits := make([dynamic]int)
	defer delete(temp_digits)

	val := decimal_val
	for val > 0 {
		remainder := val % output_base
		append(&temp_digits, remainder)
		val /= output_base
	}

	// The remainders are generated in reverse order, so we reverse the array
	// to get the final representation
	result := make([]int, len(temp_digits))
	for i in 0 ..< len(temp_digits) {
		result[i] = temp_digits[len(temp_digits) - 1 - i]
	}

	return result, nil

}
