defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter(&do_match?(&1, base))
  end

  defp do_match?(a, b) do
    if String.downcase(a) == String.downcase(b) do
      false
    else
      a
      |> String.downcase()
      |> String.to_charlist()
      |> Enum.sort() ==
        b
        |> String.downcase()
        |> String.to_charlist()
        |> Enum.sort()
    end
  end
end
