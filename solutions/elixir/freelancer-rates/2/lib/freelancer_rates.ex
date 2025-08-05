defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    (100 - discount) / 100 * before_discount
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
    daily_rate(hourly_rate) * 22 |> apply_discount(discount) |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
    budget / (daily_rate(hourly_rate) |> apply_discount(discount)) |> Float.floor(1)
  end
end
