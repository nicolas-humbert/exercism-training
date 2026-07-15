package high_scores

import "core:slice"

// Complete the HighScores data structure.
High_Scores :: struct {
	list:  [dynamic]int,
	top_3: [3]int,
}

new_scores :: proc(initial_values: []int) -> High_Scores {

	hs := High_Scores {
		list  = [dynamic]int{},
		top_3 = [3]int{0, 0, 0},
	}

	for iv in initial_values {
		append(&hs.list, iv)

		if iv >= hs.top_3[0] {
			hs.top_3[2] = hs.top_3[1]
			hs.top_3[1] = hs.top_3[0]
			hs.top_3[0] = iv
			continue
		}
		if iv >= hs.top_3[1] {
			hs.top_3[2] = hs.top_3[1]
			hs.top_3[1] = iv
			continue
		}
		if iv >= hs.top_3[2] {
			hs.top_3[2] = iv
			continue
		}
	}

	return hs
}

destroy_scores :: proc(s: ^High_Scores) {
	delete(s.list)
}

scores :: proc(s: High_Scores) -> []int {
	return slice.clone(s.list[:])
}

latest :: proc(s: High_Scores) -> int {
	if len(s.list) == 0 do return 0
	return s.list[len(s.list) - 1]
}

personal_best :: proc(s: High_Scores) -> int {
	if len(s.list) == 0 do return 0
	return s.top_3[0]
}

personal_top_three :: proc(s: High_Scores) -> []int {
	top_3 := s.top_3
	return slice.clone(top_3[:min(3, len(s.list))])
}
