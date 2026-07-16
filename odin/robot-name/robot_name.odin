package robotname

import "core:fmt"
import "core:math/rand"
import "core:mem"
import "core:mem/virtual"
import "core:strings"

POSSIBLE_NAMES :: 26 * 26 * 10 * 10 * 10

void :: struct {}

Robot_Storage :: struct {
	arena: ^virtual.Arena,
	names: map[string]void,
}

Robot :: struct {
	name: string,
}

Error :: enum {
	None,
	Could_Not_Create_Name,
	Unimplemented,
}

// In this exercise, it is the responsibility of Robot_Storage
// to manage the Robot names (strings).
make_storage :: proc() -> Robot_Storage {
	storage := Robot_Storage{}

	storage.arena = new(virtual.Arena)

	// Allocate space dynamically as it grows
	err := virtual.arena_init_growing(storage.arena, 4 * mem.Megabyte)
	if err != .None {
		return {}
	}

	arena_allocator := virtual.arena_allocator(storage.arena)
	storage.names = make(map[string]void, arena_allocator)

	return storage
}

delete_storage :: proc(storage: ^Robot_Storage) {
	virtual.arena_destroy(storage.arena)
	free(storage.arena)
}

new_robot :: proc(storage: ^Robot_Storage) -> (Robot, Error) {
	if len(storage.names) >= POSSIBLE_NAMES do return {}, .Could_Not_Create_Name

	arena_allocator := virtual.arena_allocator(storage.arena)

	buf: [5]u8

	for {
		buf[0] = u8(rand.uint_range(65, 91))
		buf[1] = u8(rand.uint_range(65, 91))
		buf[2] = u8(rand.uint_range(48, 58))
		buf[3] = u8(rand.uint_range(48, 58))
		buf[4] = u8(rand.uint_range(48, 58))

		if !(string(buf[:]) in storage.names) {
			new_name := strings.clone(string(buf[:]), arena_allocator)
			storage.names[new_name] = {}
			return Robot{name = new_name}, .None
		}
	}


}

reset :: proc(storage: ^Robot_Storage, r: ^Robot) {
	delete_key(&storage.names, r.name)
	new_r, err := new_robot(storage)

	if err != .None do return

	r.name = new_r.name
}
