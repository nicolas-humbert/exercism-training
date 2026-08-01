// Package weather tells the weather forecast based on the current location (city) and current condition.
package weather

var (
	// CurrentCondition represents the weather.
	CurrentCondition string
	// CurrentLocation is the city you are located in.
	CurrentLocation string
)

// Forecast tells the weather based on a city (CurrentLocation) and a condition (CurrentLocation).
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
