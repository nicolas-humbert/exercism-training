defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven(), do: 40

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(cooked_time) do
    expected_minutes_in_oven() - cooked_time
  end

  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(layers, cooked_time) do
    preparation_time_in_minutes(layers) + cooked_time
  end

  # Please define the 'alarm/0' function
  def alarm(), do: "Ding!"
end
