defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _) do
    :not_found
  end
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp search(numbers, key, left, right) when left > right do
    :not_found
  end
  defp search(numbers, key, left, right) do
    middle_index = div(left + right, 2)
    middle_value = elem(numbers, middle_index)
    cond do
      middle_value == key -> {:ok, middle_index}
      middle_value > key -> search(numbers, key, left, middle_index - 1)
      middle_value < key -> search(numbers, key, middle_index + 1, right)
    end
  end
end
