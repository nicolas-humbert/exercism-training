defmodule Darts do
  @type position :: {number, number}

  defp distance_from_origin({x, y}) do
    :math.sqrt(x * x + y * y)
  end

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance_from_center = distance_from_origin({x, y})
    outer_radius = 10
    middle_radius = 5
    inner_radius = 1

    cond do
      distance_from_center <= inner_radius -> 10
      distance_from_center <= middle_radius -> 5
      distance_from_center <= outer_radius -> 1
      distance_from_center > outer_radius -> 0
    end
  end
end
