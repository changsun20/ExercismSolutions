defmodule AllYourBase do
  alias DialyxirVendored.Warnings.BinaryConstruction
  alias JasonV.Encode

  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) do
    cond do
      input_base < 2 ->
        {:error, "input base must be >= 2"}

      output_base < 2 ->
        {:error, "output base must be >= 2"}

      Enum.any?(digits, &(&1 >= input_base or &1 < 0)) ->
        {:error, "all digits must be >= 0 and < input base"}

      true ->
        digits =
          digits
          |> digits_to_integer(input_base)
          |> integer_to_digits(output_base)

        {:ok, digits}
    end
  end

  defp digits_to_integer(digits, input_base) do
    digits
    |> Enum.reduce(0, fn digit, acc -> acc * input_base + digit end)
  end

  defp integer_to_digits(0, _, []), do: [0]
  defp integer_to_digits(0, _, acc \\ []), do: acc

  defp integer_to_digits(num, output_base, acc) do
    integer_to_digits(div(num, output_base), output_base, [rem(num, output_base) | acc])
  end
end
