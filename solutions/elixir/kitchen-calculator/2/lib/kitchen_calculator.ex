defmodule KitchenCalculator do
  @milliliter_conversion %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

  def get_volume({_unit, amount}), do: amount

  def to_milliliter({unit, amount}) do
    {:milliliter, amount * @milliliter_conversion[unit]}
  end

  def from_milliliter({:milliliter, amount}, unit) do
    {unit, amount / @milliliter_conversion[unit]}
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
