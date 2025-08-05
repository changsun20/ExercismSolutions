defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, datetime} =
      string
      |> NaiveDateTime.from_iso8601()

    datetime
  end

  def before_noon?(datetime) do
    datetime |> NaiveDateTime.to_time() |> Time.before?(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    case before_noon?(checkout_datetime) do
      true -> checkout_datetime |> NaiveDateTime.to_date() |> Date.add(28)
      false -> checkout_datetime |> NaiveDateTime.to_date() |> Date.add(29)
      _ -> :error
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> positive_days()
  end

  defp positive_days(days) do
    if days < 0 do
      0
    else
      days
    end
  end

  def monday?(datetime) do
    datetime |> NaiveDateTime.to_date() |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout
    |> datetime_from_string()
    |> return_date()
    |> days_late(datetime_from_string(return))
    |> late_fee(return, rate)
  end

  defp late_fee(days, return, rate) do
    if monday?(datetime_from_string(return)) do
      (days * rate * 0.5) |> floor()
    else
      days * rate
    end
  end
end
