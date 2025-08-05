defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b, do: :equal
  def compare(a, b) when length(a) == length(b), do: :unequal
  def compare(_, []), do: :superlist
  def compare([], _), do: :sublist

  def compare(a, b) when length(a) < length(b) do
    if sublist?(a, b) do
      :sublist
    else
      :unequal
    end
  end

  def compare(a, b) when length(b) < length(a) do
    if sublist?(b, a) do
      :superlist
    else
      :unequal
    end
  end

  defp sublist?(_, []), do: false
  defp sublist?([head_a | tail_a], [head_b | tail_b]) do
    if head_a === head_b and check_rest_of_a?(tail_a, tail_b) do
      true
    else
      sublist?([head_a | tail_a], tail_b)
    end
  end

  defp check_rest_of_a?([], _), do: true
  defp check_rest_of_a?(_, []), do: false
  defp check_rest_of_a?([head_a | tail_a], [head_b | tail_b]) do
    if head_a === head_b do
      check_rest_of_a?(tail_a, tail_b)
    else
      false
    end
  end

end
