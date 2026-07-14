package dnd_character

import "core:math/rand"

Character :: struct {
	strength:     int,
	dexterity:    int,
	constitution: int,
	intelligence: int,
	wisdom:       int,
	charisma:     int,
	hitpoints:    int,
}

modifier :: proc(score: int) -> int {
	score_decr := score - 10
	should_floor_down := score_decr < 0 && score_decr % 2 != 0
	return should_floor_down ? score_decr / 2 - 1 : score_decr / 2
}

ability :: proc() -> int {
	first := rand.int32_range(1, 7)
	second := rand.int32_range(1, 7)
	third := rand.int32_range(1, 7)
	fourth := rand.int32_range(1, 7)

	min_roll := min(first, second, third, fourth)

	return int(first + second + third + fourth - min_roll)
}

character :: proc() -> Character {
	c := ability()

	return Character {
		strength = ability(),
		dexterity = ability(),
		constitution = c,
		intelligence = ability(),
		wisdom = ability(),
		charisma = ability(),
		hitpoints = 10 + modifier(c),
	}
}
