defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @color_num %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}

  def label([a, b, c | _rest]) do
    (@color_num[a] * 10 + @color_num[b]) * 10 ** @color_num[c]
    |> convert_unit()
  end
  def label(colors), do: :error

  defp convert_unit(value_in_ohms) do
    cond do
      value_in_ohms < 1_000 -> {value_in_ohms, :ohms}
      value_in_ohms < 1_000_000 -> {value_in_ohms / 1000, :kiloohms}
      value_in_ohms < 1_000_000_000 -> {value_in_ohms / 1_000_000, :megaohms}
      true -> {value_in_ohms / 1_000_000_000, :gigaohms}
    end
  end
end
