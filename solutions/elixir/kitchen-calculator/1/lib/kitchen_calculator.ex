defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    {unit, value} = volume_pair
    case unit do
      :milliliter -> volume_pair
      :cup -> {:milliliter, value * 240}
      :fluid_ounce -> {:milliliter, value * 30}
      :teaspoon -> {:milliliter, value * 5}
      :tablespoon -> {:milliliter, value * 15}
    end
  end

  def from_milliliter(volume_pair, unit) do
    {_, value} = volume_pair

    case unit do
      :milliliter -> volume_pair
      :cup -> {unit, value / 240}
      :fluid_ounce -> {unit, value / 30}
      :teaspoon -> {unit, value / 5}
      :tablespoon -> {unit, value / 15}
    end
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter(unit)
  end
end
