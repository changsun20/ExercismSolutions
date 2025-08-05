defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    name = IO.gets("What is your character's name?")
           |> String.trim()
    IO.puts(name)
    name
  end

  def ask_class() do
    class = IO.gets("What is your character's class?")
            |> String.trim()
    IO.puts(class)
    class
  end

  def ask_level() do
    level = IO.gets("What is your character's level?\n")
            |> String.trim()
            |> String.to_integer()
    level
  end

  def run() do
    welcome()
    name = IO.gets("What is your character's name?\n")
           |> String.trim
    class = IO.gets("What is your character's class?\n")
            |> String.trim
    level = ask_level()
    map = %{
      class: class,
      level: level,
      name: name
    }
    IO.inspect(map, [label: "Your character"])
  end
end
