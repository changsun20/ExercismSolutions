defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(& &1.price)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(&Map.put(&1, :name, String.replace(&1.name, old_word, new_word)))
  end

  def increase_quantity(item, count) do
    item
    |> Map.put(
      :quantity_by_size,
      Enum.into(item.quantity_by_size, %{}, fn {size, quantity} ->
        {size, quantity + count}
      end)
    )
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_size, quantity}, acc -> acc + quantity end)
  end
end
