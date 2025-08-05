defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter(&do_match?(String.downcase(&1), String.downcase(base)))
  end

  defp do_match?(a, b) do
    if a == b do
      false
    else
      a
      |> String.to_charlist()
      |> Enum.sort() ==
        b
        |> String.to_charlist()
        |> Enum.sort()
    end
  end
end
