package simple_cipher

import "core:math/rand"
import "core:strings"

CHARSET := "abcdefghijklmnopqrstuvwxyz"

decode :: proc(ciphertext, key: string) -> string {
	key_count := 0

	sb := strings.builder_make()
	strings.builder_grow(&sb, len(ciphertext))

	for letter in ciphertext {
		new_letter := 97 + u8(letter) - u8(key[key_count])
		if new_letter < 97 do new_letter += 26

		strings.write_byte(&sb, new_letter)
		key_count = key_count == len(key) - 1 ? 0 : key_count + 1
	}

	return strings.to_string(sb)
}

encode :: proc(plaintext, key: string) -> string {
	key_count := 0

	sb := strings.builder_make()
	strings.builder_grow(&sb, len(plaintext))

	for letter in plaintext {
		new_letter := u8(letter) + u8(key[key_count]) - 97
		if new_letter > 122 do new_letter -= 26
		strings.write_byte(&sb, new_letter)
		key_count = key_count == len(key) - 1 ? 0 : key_count + 1
	}

	return strings.to_string(sb)
}

key :: proc() -> string {
	length := 105

	sb := strings.builder_make()
	strings.builder_grow(&sb, length)

	for _ in 0 ..= length {
		random_char := rand.choice(transmute([]u8)CHARSET)
		strings.write_byte(&sb, random_char)
	}

	return strings.to_string(sb)
}
