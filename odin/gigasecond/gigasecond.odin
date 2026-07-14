package gigasecond

import "core:fmt"
import "core:time"
import "core:time/datetime"

DURATION_TO_ADD :: 1_000_000_000

add_gigasecond_v1 :: proc(moment: datetime.DateTime) -> datetime.DateTime {
	t, ok := time.compound_to_time(moment)
	if !ok {
		fmt.printfln("Error while parsing datetime.")
		return moment
	}

	future_time := time.time_add(t, DURATION_TO_ADD * time.Second)
	future_time_datetime, _ := time.time_to_datetime(future_time)

	return future_time_datetime
}

add_gigasecond :: proc(moment: datetime.DateTime) -> datetime.DateTime {
	delta := datetime.Delta {
		seconds = DURATION_TO_ADD,
	}

	results, _ := datetime.add_delta_to_datetime(moment, delta)
	return results
}
