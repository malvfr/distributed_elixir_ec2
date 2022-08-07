defmodule Worker do
  def hello do
    {:ok, hostname} = :inet.gethostname()
    "hello world from #{hostname}"
  end
end
