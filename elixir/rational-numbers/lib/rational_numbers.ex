defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(_a = {a1, b1}, _b = {a2, b2}) do
    {a1 * b2 + a2 * b1, b1 * b2} |> reduce
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(_a = {a1, b1}, _b = {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2} |> reduce
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(_a = {a1, b1}, _b = {a2, b2}) do
    {a1 * a2, b1 * b2} |> reduce
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(_num = {a1, b1}, _den = {a2, b2}) do
    {a1 * b2, a2 * b1} |> reduce
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(_a = {a1, a2}) do
    {Kernel.abs(a1), Kernel.abs(a2)} |> reduce
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n < 0 do
    {b ** -n, a ** -n} |> reduce
  end

  def pow_rational({a, b}, n) do
    {a ** n, b ** n} |> reduce
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    x ** (a / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({x, y}) when y < 0, do: reduce({-x, -y})

  def reduce({x, y}) do
    den = Integer.gcd(x, y)
    {x / den, y / den}
  end
end
