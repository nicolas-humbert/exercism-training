defmodule BirdCount do
  def today(list) when list == [], do: nil
  def today([head | _tail]), do: head

  def increment_day_count(list) when list == [], do: [1]

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?(list), do: 0 in list

  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days([]), do: 0
  def busy_days([head | tail]) when head >= 5, do: 1 + busy_days(tail)
  def busy_days([_head | tail]), do: 0 + busy_days(tail)
end
