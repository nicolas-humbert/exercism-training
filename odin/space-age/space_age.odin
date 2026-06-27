package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

age :: proc(planet: Planet, seconds: int) -> f64 {
	orbital_period: f64
	one_year: f64 = 31_557_600.0

	switch planet {
	case .Mercury:
		orbital_period = 0.2408467
	case .Venus:
		orbital_period = 0.61519726
	case .Earth:
		orbital_period = 1.0
	case .Mars:
		orbital_period = 1.8808158
	case .Jupiter:
		orbital_period = 11.862615
	case .Saturn:
		orbital_period = 29.447498
	case .Uranus:
		orbital_period = 84.016846
	case .Neptune:
		orbital_period = 164.79132
	case:
		orbital_period = 1.0
	}

	years_on_earth: f64 = f64(seconds) / one_year

	return years_on_earth * (1 / orbital_period)
}
