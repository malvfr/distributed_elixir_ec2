defmodule Worker do
  def hello do
    {:ok, hostname} = :inet.gethostname()
    IO.puts("Hello world from #{hostname}")
  end

  def hello_random do
    get_nodes()
    |> Enum.random()
    |> Node.spawn_link(fn -> hello() end)
  end

  def hello_from_all_nodes do
    get_nodes()
    |> Enum.each(fn node ->
      Node.spawn_link(node, fn -> hello() end)
    end)
  end

  def get_nodes do
    Node.list() ++ Node.list(:this)
  end
end
