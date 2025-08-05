defmodule BirdCount do
  def today([]) do
    nil
  end
  def today(list) do
    hd(list)
  end

  def increment_day_count([]) do
    [1]
  end
  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?(list) do
    0 in list
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days([]) do
    0
  end
  def busy_days([head | tail]) when head > 4 do
    1 + busy_days(tail)
  end
  def busy_days([_ | tail]) do
    busy_days(tail)
  end
end
