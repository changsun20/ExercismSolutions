defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    do_convert(number, "", 3)
  end

  defp do_convert(number, acc, index) do
    cond do
      rem(number, 3) == 0 and index <= 3 -> do_convert(number, acc <> "Pling", 5)
      rem(number, 5) == 0 and index <= 5 -> do_convert(number, acc <> "Plang", 7)
      rem(number, 7) == 0 and index <= 7 -> do_convert(number, acc <> "Plong", 9)
      acc == "" -> Integer.to_string(number)
      true -> acc
    end
  end
end
