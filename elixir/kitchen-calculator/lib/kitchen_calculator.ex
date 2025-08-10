defmodule KitchenCalculator do
  def get_volume(_volume_pair = {_, pair}), do: pair

  def to_milliliter(_volume_pair = {:cup, num}), do: {:milliliter, num * 240}
  def to_milliliter(_volume_pair = {:fluid_ounce, num}), do: {:milliliter, num * 30}
  def to_milliliter(_volume_pair = {:teaspoon, num}), do: {:milliliter, num * 5}
  def to_milliliter(_volume_pair = {:tablespoon, num}), do: {:milliliter, num * 15}
  def to_milliliter(volume_pair = {:milliliter, _num}), do: volume_pair

  def from_milliliter(_volume_pair = {:milliliter, num}, _unit = :cup),
    do: {:cup, num / 240}

  def from_milliliter(_volume_pair = {:milliliter, num}, _unit = :fluid_ounce),
    do: {:fluid_ounce, num / 30}

  def from_milliliter(_volume_pair = {:milliliter, num}, _unit = :teaspoon),
    do: {:teaspoon, num / 5}

  def from_milliliter(_volume_pair = {:milliliter, num}, _unit = :tablespoon),
    do: {:tablespoon, num / 15}

  def from_milliliter(volume_pair = {:milliliter, _num}, _unit = :milliliter), do: volume_pair

  def convert(volume_pair = {base_unit, _base_value}, unit) when base_unit == unit do
    volume_pair
  end

  def convert(volume_pair, unit) do
    milli_pair = to_milliliter(volume_pair)
    from_milliliter(milli_pair, unit)
  end
end
