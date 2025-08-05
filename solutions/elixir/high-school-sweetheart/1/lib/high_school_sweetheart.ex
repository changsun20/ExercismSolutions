defmodule HighSchoolSweetheart do
  def first_letter(<<letter::utf8, _::binary>>) when letter in ?a..?z or letter in ?A..?Z do
    <<letter::utf8>>
  end
  def first_letter(<<_::utf8, rest::binary>>) do
    first_letter(rest)
  end


  def initial(name) do
    name
    |> first_letter()
    |> String.upcase()
    |> Kernel.<>(".")
  end


  def initials(full_name) do
    full_name
    |> String.split(" ")
    |> Enum.map(&initial/1)
    |> Enum.join(" ")
  end

  
  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{full_name1 |> initials()}  +  #{full_name2 |> initials()}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
