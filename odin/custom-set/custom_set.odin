package custom_set

import "core:fmt"
import "core:slice"

Set :: map[int]int

new_set :: proc(elements: ..int) -> Set {
	set: Set = make(map[int]int)

	for n in elements do set[n] = n

	return set
}

destroy_set :: proc(s: ^Set) {
	delete_map(s^)
}

to_string :: proc(s: Set) -> string {
	keys: [dynamic]int = {}

	for el in s {
		append(&keys, el)
	}

	slice.sort(keys[:])

	str := fmt.tprint(keys)

	return str
}

is_empty :: proc(s: Set) -> bool {
	return len(s) == 0
}

contains :: proc(s: Set, element: int) -> bool {
	return element in s
}

is_subset :: proc(s: Set, other: Set) -> bool {
	for el in s {
		if !(el in other) do return false
	}

	return true
}

is_disjoint :: proc(s: Set, other: Set) -> bool {
	if is_empty(s) do return true

	for el in s {
		if el in other do return false
	}

	return true
}

equal :: proc(s: Set, other: Set) -> bool {
	return len(s) == len(other) && is_subset(s, other)
}

add :: proc(s: ^Set, elements: ..int) {

	for el in elements {
		s[el] = el
	}
}

intersection :: proc(s: Set, other: Set) -> Set {
	set: Set

	for el in s {
		if el in other do set[el] = el
	}

	return set
}

difference :: proc(s: Set, other: Set) -> Set {
	// Implement this procedure.
	set: Set

	for el in s {
		if !(el in other) do set[el] = el
	}

	return set
}

// union is a reserved word in Odin, using join instead.
join :: proc(s: Set, other: Set) -> Set {
	// Implement this procedure.
	set: Set

	for el in s do set[el] = el
	for el in other do set[el] = el

	return set
}
