package allergies

Allergen :: enum {
	Eggs,
	Peanuts,
	Shellfish,
	Strawberries,
	Tomatoes,
	Chocolate,
	Pollen,
	Cats,
}

allergic_to :: proc(score: int, allergen: Allergen) -> bool {
	sanitized_score := score % 256
	BIT_INDEX := uint(allergen)
	bit_b := (sanitized_score >> BIT_INDEX) & 1
	return bool(bit_b)
}

list :: proc(score: int) -> []Allergen {
	sanitized_score := score % 256

	buf: [dynamic]Allergen = {}

	for i: uint = 0; i < 8; i += 1 {
		bit_b := (sanitized_score >> i) & 1

		if bool(bit_b) {
			append_elem(&buf, Allergen(i))
		}
	}
	return buf[:]
}
