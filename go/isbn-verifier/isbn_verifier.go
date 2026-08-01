package isbnverifier

import (
	"strconv"
	"strings"
)

func IsValidISBN(isbn string) bool {
	code := strings.ReplaceAll(isbn, "-", "")
	if len(code) != 10 {
		return false
	}

	acc := 0
	for i := 0; i < len(code); i++ {

		if code[i] == 'X' && i == 9 {
			acc += 10
		} else {
			charInt, err := strconv.Atoi(string(code[i]))
			if err != nil {
				return false
			} else {
				acc += (len(code) - i) * charInt
			}
		}
	}
	return acc%11 == 0
}
