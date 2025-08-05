defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    do_keep(list, fun)
  end

  defp do_keep(_, _, acc \\ [])
  defp do_keep([], _, acc), do: acc

  defp do_keep([head | tail], fun, acc) do
    case fun.(head) do
      true -> do_keep(tail, fun, acc ++ [head])
      false -> do_keep(tail, fun, acc)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    do_discard(list, fun)
  end

  defp do_discard(_, _, acc \\ [])
  defp do_discard([], _, acc), do: acc

  defp do_discard([head | tail], fun, acc) do
    case fun.(head) do
      false -> do_discard(tail, fun, acc ++ [head])
      true -> do_discard(tail, fun, acc)
    end
  end
end
