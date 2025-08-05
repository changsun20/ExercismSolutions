defmodule TakeANumber do
  def start() do
    spawn(fn -> machine(0) end)
  end

  defp machine(state \\ 0) do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        machine(state)
      {:take_a_number, pid} ->
        send(pid, state+1)
        machine(state+1)
      :stop -> :stop
      _ -> machine(state)

    end

  end
end
