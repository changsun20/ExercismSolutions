defmodule LogLevel do
  def to_label(level, legacy?) do
    # Please implement the to_label/2 function
    if legacy? do
      case level do
        1 -> :debug
        2 -> :info
        3 -> :warning
        4 -> :error
        _ -> :unknown
      end
    else
      case level do
        0 -> :trace
        1 -> :debug
        2 -> :info
        3 -> :warning
        4 -> :error
        5 -> :fatal
        _ -> :unknown
      end
    end
  end

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
    cond do
      to_label(level, legacy?) == :error
        or to_label(level, legacy?) == :fatal -> :ops
      to_label(level, legacy?) == :unknown and legacy? -> :dev1
      to_label(level, legacy?) == :unknown -> :dev2
      true -> false
    end
  end
end
