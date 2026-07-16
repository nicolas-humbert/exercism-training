package pascals_triangle

rows :: proc(count: int) -> [][]u128 {
	if count == 0 do return {}

	rows := make([][]u128, count)

	for i := 0; i < count; i += 1 {
		num_cols := i + 1
		rows[i] = make([]u128, num_cols)

		rows[i][0] = 1
		rows[i][num_cols - 1] = 1

		for j := 1; j < i; j += 1 {
			rows[i][j] = rows[i - 1][j - 1] + rows[i - 1][j]
		}
	}

	return rows
}
