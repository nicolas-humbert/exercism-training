package anagram

import "core:strings"
import "core:unicode"

find_anagrams :: proc(word: string, candidates: []string) -> []string {
	results := make([dynamic]string)

	word_lower := strings.to_lower(word, context.temp_allocator)

	memo := make_map(map[rune]int)
	defer delete_map(memo)

	candidate_loop: for candidate in candidates {
		candidate_lower := strings.to_lower(candidate, context.temp_allocator)

		if candidate_lower == word_lower do continue

		// Reset memo for each candidate
		clear_map(&memo)
		for r in word_lower do memo[r] += 1

		for r in candidate {
			r_lower := unicode.to_lower(r)
			if !(r_lower in memo) do continue candidate_loop
			memo[r_lower] -= 1
		}

		for m in memo {
			if memo[m] != 0 do continue candidate_loop
		}

		append_elem(&results, candidate)
	}


	return results[:]
}
