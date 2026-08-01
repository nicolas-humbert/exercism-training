package differenceofsquares

func SquareOfSum(n int) int {
	acc := 0
	for i := 1; i <= n; i++ {
		acc += i
	}

	return acc * acc
}

func SumOfSquares(n int) int {
	acc := 0
	for i := 1; i <= n; i++ {
		acc += i * i
	}

	return acc
}

func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
