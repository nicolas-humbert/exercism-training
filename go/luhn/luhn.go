package luhn

import (
	"strconv"
	"strings"
)

func Valid(id string) bool {
	code := strings.ReplaceAll(id, " ", "")

	if len(code) < 2 {
		return false
	}

	totalAcc := 0
	shouldDouble := false

	for i := len(code) - 1; i >= 0; i-- {

		conv, err := strconv.Atoi(string(code[i]))
		if err != nil {
			return false
		}
		if shouldDouble {
			newValue := conv * 2
			if newValue > 9 {
				totalAcc += newValue - 9
			} else {
				totalAcc += newValue
			}
		} else {
			totalAcc += conv
		}

		shouldDouble = !shouldDouble
	}

	return totalAcc%10 == 0

}
