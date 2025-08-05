defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    data
    |> do_extract(String.split(path, "."))
  end

  defp do_extract(data, []), do: data
  defp do_extract(data, [head | tail]), do: do_extract(data[head], tail)

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
