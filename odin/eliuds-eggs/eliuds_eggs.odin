package eliuds_eggs

import "core:fmt"

egg_count :: proc(number: uint) -> uint {
	buf: [32]byte
	str := fmt.bprintf(buf[:], "%b", number)

	acc: uint
	for char in str {
		if char == '1' do acc += 1
	}

	return acc
}
