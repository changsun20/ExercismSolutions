defmodule Username do
  @spec sanitize(username :: charlist) :: charlist
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    username
    |> Enum.filter(&(&1 in ?a..?z
                     or &1 in [?_, ?ä, ?ö, ?ü, ?ß]))
    |> Enum.map(&(change_german/1))
    |> List.flatten()
  end

  defp change_german(char) do
    case char do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> char
    end
  end
end
