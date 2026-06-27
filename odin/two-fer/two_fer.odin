package two_fer

import "core:fmt"
two_fer :: proc(name: string = "you") -> string {
	str := fmt.aprintf("One for %s, one for me.", name)
	return str
}
