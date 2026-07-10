package clock

import "core:fmt"

// Implement this struct
Clock :: struct {
	hours:   int,
	minutes: int,
}

MINUTES_IN_DAY :: 24 * 60

create_clock :: proc(hour, minute: int) -> Clock {
	minutes_to_hours_overflow := minute / 60
	minutes_rest := minute % 60
	overflown_hours := (hour + minutes_to_hours_overflow) % 24

	should_correct_negative_minutes := minutes_rest < 0
	should_correct_negative_hours := overflown_hours < 0

	if should_correct_negative_minutes {
		minutes_rest = 60 + minutes_rest
		overflown_hours -= 1
	}

	if should_correct_negative_hours {
		overflown_hours = 24 + overflown_hours
	}


	return Clock{hours = overflown_hours, minutes = minutes_rest}
}

to_string :: proc(clock: Clock) -> string {
	// Implement this procedure.
	return fmt.aprintf("%02d:%02d", clock.hours, clock.minutes)
}

add :: proc(clock: ^Clock, minutes: int) {
	full_minutes := clock.minutes + minutes
	added_hours := full_minutes / 60
	rest_minutes := full_minutes % 60

	clock.hours += added_hours
	clock.minutes = rest_minutes

	for clock.hours >= 24 {
		clock.hours -= 24
	}
}

subtract :: proc(clock: ^Clock, minutes: int) {

	number_of_days_overflow := minutes % MINUTES_IN_DAY
	add(clock, number_of_days_overflow * MINUTES_IN_DAY - minutes)
}

equals :: proc(clock1, clock2: Clock) -> bool {
	if clock1.hours != clock2.hours do return false
	if clock1.minutes != clock2.minutes do return false
	return true
}
