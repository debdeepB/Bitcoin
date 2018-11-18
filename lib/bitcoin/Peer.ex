defmodule Peer do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state)
  end

  def increment_hops(pid, key) do
    GenServer.cast(pid, {:increment_hops, key})
  end

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:increment_hops, key}, state) do
    state =
      if Map.has_key?(state, key) do
        hops = Map.get(state, key)
        Map.put(state, key, hops + 1)
      else
        Map.put(state, key, 1)
      end

    {:noreply, state}
  end
end