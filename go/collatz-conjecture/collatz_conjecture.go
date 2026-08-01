package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	if n < 1 {
		return 0, errors.New("Number must be 1 or higher")
	}

	steps := 0

	for {
		if n == 1 {
			break
		}
		if n%2 == 0 {
			n /= 2
		} else {
			n = n*3 + 1
		}
		steps++
	}

	return steps, nil
}
